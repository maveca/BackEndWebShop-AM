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
                // field(image; getItemImage(Rec)) { }
            }
        }
    }

    local procedure getItemImage(var Item: Record Item): Text
    var
        TenantMedia: Record "Tenant Media";
        Base64Convert: Codeunit "Base64 Convert";
        MediaInStream: InStream;
        MediaJsonObject: JsonObject;
        MediaJsonToken: JsonToken;
    begin
        if Item.Picture.Count = 0 then
            exit('');

        TenantMedia.Get(Item.Picture.Item(1));
        TenantMedia.CalcFields(Content);
        if not TenantMedia.Content.HasValue() then
            exit('');

        TenantMedia.Content.CreateInStream(MediaInStream, TextEncoding::Windows);
        MediaJsonObject.Add('image', Base64Convert.ToBase64(MediaInStream));
        MediaJsonObject.SelectToken('image', MediaJsonToken);
        exit(MediaJsonToken.AsValue().AsText());
    end;
}
