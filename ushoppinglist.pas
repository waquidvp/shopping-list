unit UShoppingList;
//test program for unsorted list in UArrayList


interface

uses
  Classes, SysUtils,  Forms, Controls, Graphics, Dialogs, StdCtrls,UArrayList;

type

  { TShoppingListForm }

  TShoppingListForm = class(TForm)
    AddBtn: TButton;
    FindBtn: TButton;
    DeleteBtn: TButton;
    IndexEdit: TEdit;
    RemoveBtn: TButton;
    ItemProductEdit: TEdit;
    ItemQuantityEdit: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    ShoppingListBox: TListBox;
    procedure AddBtnClick(Sender: TObject);
    procedure DeleteBtnClick(Sender: TObject);
    procedure FindBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure RemoveBtnClick(Sender: TObject);
  private
    { private declarations }
    ShoppingList:TArrayList;
  public
    { public declarations }
    //display the ShoppingList in the ShoppingListBox
    procedure UpdateDisplay;
  end; 

var
  ShoppingListForm: TShoppingListForm;

implementation

{$R *.dfm}

{ TShoppingListForm }

procedure TShoppingListForm.FormCreate(Sender: TObject);
begin
  ShoppingList:=TArrayList.Create;
end;

procedure TShoppingListForm.FormDestroy(Sender: TObject);
begin
  FreeandNil(ShoppingList);
end;

procedure TShoppingListForm.RemoveBtnClick(Sender: TObject);
var
  ItemtoRemove:TItem;
begin
  ItemToRemove.Product:=ItemProductEdit.Text;
  ShoppingList.Remove(ItemToRemove);
  UpdateDisplay;
end;

procedure TShoppingListForm.UpdateDisplay;
//display the ShoppingList in the ShoppingListBox
var
  DisplayItem:TItem;
  i:integer;
begin
  ShoppingListBox.Clear;
  if ShoppingList.Length>0 then
    for i:=1 to ShoppingList.Length do
    begin
      DisplayItem:=ShoppingList.Retrieve(i);
      ShoppingListBox.Items.Add(DisplayItem.product+': '+inttostr(DisplayItem.quantity));
    end;
end;

procedure TShoppingListForm.AddBtnClick(Sender: TObject);
var
  NewItem:TItem;
begin
  NewItem.product:=ItemProductEdit.Text;
  NewItem.quantity:=strtoint(ItemQuantityEdit.Text);
  ShoppingList.Add(NewItem);
  UpdateDisplay;
end;

procedure TShoppingListForm.DeleteBtnClick(Sender: TObject);
begin
  ShoppingList.Delete(strtoint(IndexEdit.Text));
  UpdateDisplay;
end;

procedure TShoppingListForm.FindBtnClick(Sender: TObject);
var
  WantedItem:TItem;
  location:integer;
begin
  WantedItem.Product:=ItemProductEdit.Text;
  if ShoppingList.Found(WantedItem,location) then
    ShoppingListBox.ItemIndex:=location-1; //highlight found item
end;

end.

