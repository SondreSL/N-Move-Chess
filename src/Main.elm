module Main exposing (..)

import Browser
import Css exposing (..)
import Html.Styled exposing (Html, div, footer, h1, img, main_, nav, text, toUnstyled)
import Html.Styled.Attributes exposing (src)



---- MODEL ----


type alias Model =
    {}


init : ( Model, Cmd Msg )
init =
    ( {}, Cmd.none )



---- UPDATE ----


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )



---- VIEW ----


navBar =
    nav [] []


headerSection =
    navBar


mainSection =
    main_ [] []


footerSection =
    footer [] []


view : Model -> Html Msg
view model =
    div []
        [ headerSection
        , mainSection
        , footerSection
        ]



---- PROGRAM ----


main : Program () Model Msg
main =
    Browser.element
        { view = view >> toUnstyled
        , init = \_ -> init
        , update = update
        , subscriptions = always Sub.none
        }
