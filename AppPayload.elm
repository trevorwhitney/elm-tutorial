module Main exposing (..)

import Html exposing (Html, button, div, text, program)
import Html.Events exposing (onClick)


type alias Model =
    Int


init : ( Model, Cmd Msg )
init =
    ( 0, Cmd.none )


type Msg
    = Increment Int
    | Decrement Int


view : Model -> Html Msg
view model =
    div []
        [ button [ onClick (Decrement 1) ] [ text "-" ]
        , text (toString model)
        , button [ onClick (Increment 2) ] [ text "+" ]
        ]


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Increment howMuch ->
            ( model + howMuch, Cmd.none )

        Decrement howMuch ->
            ( model - howMuch, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


main : Program Never Model Msg
main =
    program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
