module Main exposing (..)

import Browser
import Css exposing (..)
import Css.Global exposing (children, typeSelector)
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
    let
        containerStyle =
            css
                [ displayFlex
                , flexDirection column
                , justifyContent center
                , alignItems center
                , margin2 zero (rem 1)
                , position relative
                , hover
                    [ children
                        [ typeSelector "span"
                            [ bottom (px 5)
                            , opacity (int 1)
                            ]
                        ]
                    ]
                ]

        linkStyle =
            css
                [ color (rgb 255 255 255)
                , textDecoration none
                , fontSize (rem 1.5)
                , margin2 (px 7) zero
                ]

        underlineStyle =
            css
                [ width (pct 100)
                , height (px 2)
                , opacity (int 0)
                , backgroundColor (rgb 255 255 255)
                , position absolute
                , left zero
                , bottom zero
                , transition
                    [ Css.Transitions.bottom3 150 0 easeInOut
                    , Css.Transitions.opacity3 150 0 easeInOut
                    ]
                ]
    in
    div
        [ containerStyle ]
        [ a [ href url, linkStyle ] [ text t ]
        , span [ underlineStyle ] []
        ]


navLinks : Html msg
navLinks =
    div [ css [ displayFlex, flexDirection row ] ]
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
    let
        boardColors =
            { white = rgb 255 219 172, black = rgb 141 85 36 }

        rowStyle =
            [ css
                [ displayFlex
                , flexDirection row
                , nthOfType "even" [ children [ typeSelector "div" [ nthOfType "odd" [ backgroundColor boardColors.white ] ] ] ]
                , nthOfType "odd" [ children [ typeSelector "div" [ nthOfType "even" [ backgroundColor boardColors.white ] ] ] ]
                ]
            ]

        cellStyle =
            [ css
                [ width (px 100)
                , height (px 100)
                , backgroundColor boardColors.black
                ]
            ]
    in
    main_
        [ css
            [ displayFlex
            , flexDirection column
            , justifyContent center
            , alignItems center
            , width (pct 100)
            , padding (rem 1)
            ]
        ]
        (List.repeat 8 (div rowStyle (List.repeat 8 (div cellStyle []))))


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
