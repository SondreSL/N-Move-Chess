module Main exposing (..)

import Browser
import Css exposing (..)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css)



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
    nav
        [ css
            [ displayFlex
            , flexDirection row
            , justifyContent spaceBetween
            , alignItems center
            , width (pct 100)
            , height (rem 4)
            , padding2 zero (rem 1)
            , backgroundColor (rgb 0 0 255)
            , color (rgb 255 255 255)
            ]
        ]
        [ span [ css [ fontSize (rem 2) ] ] [ text "N-Chess" ] ]


headerSection =
    navBar


mainSection =
    main_ [] []


footerSection =
    footer [] []


view : Model -> Html Msg
view model =
    div
        [ css
            [ displayFlex
            , flexDirection column
            , width (pct 100)
            ]
        ]
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
