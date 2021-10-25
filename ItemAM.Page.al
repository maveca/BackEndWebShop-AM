/// <summary>
/// Page Item-AM (ID 50100).
/// </summary>
page 50100 "Item-AM"
{

    APIGroup = 'webShop';
    APIPublisher = 'beTerna';
    APIVersion = 'v1.0';
    Caption = 'itemAM';
    DelayedInsert = true;
    EntityName = 'itemAM';
    EntitySetName = 'itemsAM';
    PageType = API;
    SourceTable = Item;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(number; Rec."No.") { }
                field(displayName; Rec.Description) { }
                field(image; Rec.Picture) { }
            }
        }
    }
}
