module Main exposing (Flags, main)

import Browser
import Browser.Navigation
import Html.Styled exposing (Html, toUnstyled)
import I18n.Keys exposing (Key(..))
import I18n.Translate exposing (Language(..))
import Page.CaseStudy
import Page.Index
import Page.Resource
import Route exposing (Route(..))
import Shared exposing (Model, Msg(..))
import Theme.PageTemplate
import Url


type alias Flags =
    ()


main : Program Flags Model Msg
main =
    Browser.application
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = viewDocument
        , onUrlRequest = LinkClicked
        , onUrlChange = UrlChanged
        }


init : Flags -> Url.Url -> Browser.Navigation.Key -> ( Model, Cmd Msg )
init flags url key =
    let
        maybeRoute =
            Route.fromUrl url
    in
    ( { key = key
      , page = Maybe.withDefault Index maybeRoute
      , language = English
      }
    , Cmd.none
    )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        UrlChanged url ->
            let
                newRoute =
                    -- If not a valid route, go to index
                    -- could 404 instead depends on desired behaviour
                    Maybe.withDefault Index (Route.fromUrl url)
            in
            ( { model | page = newRoute }, Cmd.none )

        LinkClicked urlRequest ->
            case urlRequest of
                Browser.Internal url ->
                    ( model
                    , Browser.Navigation.pushUrl model.key (Url.toString url)
                    )

                Browser.External href ->
                    ( model
                    , Browser.Navigation.load href
                    )

        LanguageChangeRequested ->
            ( if model.language == English then
                { model | language = Welsh }

              else
                { model | language = English }
            , Cmd.none
            )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


viewDocument : Model -> Browser.Document Msg
viewDocument model =
    { title = "[cCc] App title", body = [ toUnstyled (view model) ] }


view : Model -> Html Msg
view model =
    case model.page of
        Index ->
            Theme.PageTemplate.view model
                { title = SiteTitle, content = Page.Index.view model }

        CaseStudy ->
            Theme.PageTemplate.view model
                { title = CaseStudyTitle, content = Page.CaseStudy.view model }

        Resource ->
            Theme.PageTemplate.view model
                { title = ResourceTitle, content = Page.Resource.view model }
