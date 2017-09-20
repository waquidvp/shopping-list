program PShoppingList;

uses
  Vcl.Forms,
  ushoppinglist in 'ushoppinglist.pas' {ShoppingListForm},
  uArrayList in 'uArrayList.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TShoppingListForm, ShoppingListForm);
  Application.Run;
end.
