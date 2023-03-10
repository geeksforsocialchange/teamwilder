module Route exposing (Route(..), fromUrl)

import Url
import Url.Parser as Parser exposing ((</>), Parser, map, oneOf, s, string, top)


type Route
    = Index
    | Story String
    | Guide String


fromUrl : Url.Url -> Maybe Route
fromUrl url =
    url
        |> Parser.parse routeParser


toString : Route -> String
toString route =
    case route of
        Index ->
            "/"

        Story s ->
            "/stories" ++ "/" ++ s

        Guide s ->
            "/guides" ++ "/" ++ s


routeParser : Parser (Route -> a) a
routeParser =
    oneOf
        [ map Index top
        , map Story (s "stories" </> string)
        , map Guide (s "guides" </> string)
        ]
