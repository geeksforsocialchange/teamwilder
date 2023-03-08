module Page.Index exposing (view)

import Browser
import Html.Styled exposing (toUnstyled)
import I18n.Keys exposing (Key(..))
import I18n.Translate exposing (translate)
import Shared exposing (Model, Msg)
import Theme.PageTemplate as PageTemplate


view : Model -> Browser.Document Msg
view model =
    { title = translate model.language SiteTitle
    , body =
        [ toUnstyled
            (PageTemplate.view
                { language = model.language
                , title = SiteTitle
                }
            )
        ]
    }
