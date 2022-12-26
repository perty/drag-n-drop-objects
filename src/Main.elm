module Main exposing (main)

import Browser
import Html exposing (button, div, img, text)
import Html.Attributes exposing (class, href, src)
import Html.Events exposing (onClick)
import Model


type alias Model =
    { inbox : Model.Inbox
    , showInbox : Bool
    }


type Message
    = ClickedInbox


main : Program () Model Message
main =
    Browser.element
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }


init : flags -> ( Model, Cmd message )
init _ =
    ( { inbox = Model.Inbox [], showInbox = False }, Cmd.none )


update : Message -> Model -> ( Model, Cmd Message )
update message model =
    case message of
        ClickedInbox ->
            ( { model | showInbox = not model.showInbox }, Cmd.none )


view : Model -> Html.Html Message
view model =
    div [ class "row" ]
        [ div [ class "column" ]
            [ img [ src "images/inbox.png", onClick ClickedInbox ] []
            ]
        , if model.showInbox then
            viewInbox model

          else
            div [] []
        ]


viewInbox : Model -> Html.Html Message
viewInbox model =
    div []
        [ text "Here is the inbox. It is a list of folders."
        , button [ onClick ClickedInbox ] [ text "Avbryt" ]
        ]


subscriptions : Model -> Sub message
subscriptions _ =
    Sub.none
