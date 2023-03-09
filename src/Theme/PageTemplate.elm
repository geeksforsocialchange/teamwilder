module Theme.PageTemplate exposing (..)

import Css exposing (Style, batch)
import Html.Styled exposing (Html, button, div, main_, p, text)
import Html.Styled.Attributes exposing (css)
import Html.Styled.Events exposing (onClick)
import I18n.Keys exposing (Key(..))
import I18n.Translate exposing (Language(..), translate)
import Route exposing (Route(..))
import Shared exposing (Model, Msg(..))
import Theme.FooterTemplate as FooterTemplate
import Theme.HeaderTemplate as HeaderTemplate


type alias Title =
    Key


type alias PageInfo =
    { title : Key, content : Html Msg }


view : Model -> PageInfo -> Html Msg
view model pageInfo =
    let
        t =
            translate model.language
    in
    div [ css [ defaultPageStyle ] ]
        [ HeaderTemplate.view { content = t pageInfo.title }
        , main_ [ css [ mainStyle ] ]
            [ button [ onClick LanguageChangeRequested ] [ text (t ChangeLanguage) ]
            , div []
                [ pageInfo.content
                ]
            ]
        , FooterTemplate.view
        ]


mainStyle : Style
mainStyle =
    batch
        []


defaultPageStyle : Style
defaultPageStyle =
    batch
        []
