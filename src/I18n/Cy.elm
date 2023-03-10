module I18n.Cy exposing (cyStrings)

import I18n.Keys exposing (Key(..))


cyStrings : Key -> String
cyStrings key =
    case key of
        SiteTitle ->
            "[cCc] Team Wilder CY"

        StoryTitle ->
            "[cCc] Story CY"

        GuideTitle ->
            "[cCc] Guide CY"

        ChangeLanguage ->
            "[cCc] Switch to English"

        FooterTitleColumnA ->
            "[cCc] ππππππ"

        FooterTitleColumnB ->
            "[cCc] πππππππ"

        FooterTitleColumnC ->
            "[cCc] π¦Ύπ¦Ύπ¦Ύπ¦Ύπ¦Ύπ¦Ύ"

        FooterVisitWebsiteText ->
            "[cCc] π³π²π²π³π³π²πΏοΈπ³π²π³π³"

        FooterVisitWebsiteLink ->
            --[cCc]
            "https://www.wildlifetrusts.org/"

        FooterFindYourLocalTrustText ->
            "[cCc] π³π²π²π³π³π²πΏοΈπ³π²π³π³"

        FooterFindYourLocalTrustLink ->
            --[cCc]
            "https://www.wildlifetrusts.org/wildlife-trusts"

        _ ->
            "[cCc] [fFf] to reminder to add all Welsh Keys back"
