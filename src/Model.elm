module Model exposing (Document, Folder, Inbox)

{-
   The inbox contains application folders. Each folder contains an application form and possibly other documents.
-}


type alias Inbox =
    { folders : List Folder
    }


type alias Folder =
    { documents : List Document
    }


type alias Document =
    { title : String
    }
