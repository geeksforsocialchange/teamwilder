module Theme.PageTemplate exposing (PageInfo, view)

import Css exposing (Style, alignItems, auto, batch, center, column, displayFlex, flex2, flexBasis, flexDirection, height, int, minHeight, pct, vh)
import Html.Styled exposing (Html, button, div, main_, text)
import Html.Styled.Attributes exposing (css)
import Html.Styled.Events exposing (onClick)
import I18n.Keys exposing (Key(..))
import I18n.Translate exposing (translate)
import Message exposing (Msg(..))
import Shared exposing (Model)
import Theme.FooterTemplate as FooterTemplate
import Theme.HeaderTemplate as HeaderTemplate


type alias PageInfo =
    { title : Key, content : Html Msg }


view : Model -> PageInfo -> Html Msg
view model pageInfo =
    let
        t : Key -> String
        t =
            translate model.language
    in
    div [ css [ pageWrapperStyle ] ]
        [ div [ css [ pageStyle ] ]
            [ HeaderTemplate.view { content = t pageInfo.title }
            , main_ [ css [ mainStyle ] ]
                [ button [ onClick LanguageChangeRequested ] [ text (t ChangeLanguage) ]
                , div []
                    [ pageInfo.content
                    ]
                ]
            ]
        , FooterTemplate.view model.language
        ]


mainStyle : Style
mainStyle =
    batch
        []


pageStyle : Style
pageStyle =
    batch
        [ flex2 (int 1) (int 0), flexBasis auto ]


pageWrapperStyle : Style
pageWrapperStyle =
    batch
        [ alignItems center
        , displayFlex
        , flexDirection column
        , height (pct 100)
        , minHeight (vh 100)
        ]
