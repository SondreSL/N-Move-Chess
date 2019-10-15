module Main exposing (..)

import Browser
import Css exposing (..)
import Css.Transitions exposing (easeInOut, transition)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css, href)



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


navLink : String -> String -> Html msg
navLink url t =
    a
        [ href url
        , css
            [ margin2 zero (rem 1)
            , color (rgb 255 255 255)
            , fontSize (rem 1.5)
            , textDecoration none
            , borderBottom3 (px 2) solid transparent
            , transition
                [ Css.Transitions.borderBottomColor3 150 0 easeInOut
                ]
            , hover
                [ borderBottomColor (rgb 255 255 255)
                ]
            ]
        ]
        [ text t ]


navLinks : Html msg
navLinks =
    div []
        [ navLink "/" "Home", navLink "/test1" "Test 1", navLink "/test2" "Test 2" ]


navBar : Html msg
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
            , backgroundColor (rgb 58 112 207)
            , color (rgb 255 255 255)
            ]
        ]
        [ span
            [ css
                [ fontSize (rem 2) ]
            ]
            [ text "N-Chess" ]
        , navLinks
        ]


headerSection : Html msg
headerSection =
    navBar


mainSection : Html msg
mainSection =
    main_ [] []


footerSection : Html msg
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
