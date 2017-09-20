unit uArrayList;

interface

uses
  Classes, SysUtils;

type
  TItem = record
    product: string;
    quantity: integer;
  end;

  { TLinearList }

  TArrayList = class
  private
    FList: array [1 .. 100] of TItem;
    FLength: integer;
  public
    constructor Create;

    // adds Item to list
    procedure Add(Item: TItem);

    // removes all items that match Item, returns true if there were any
    function Remove(Item: TItem): boolean;

    // deletes nth item
    procedure Delete(n: integer);

    // search for Item and return whether or not it is there
    // location parameter will contain index of first match
    function Found(Item: TItem; var location: integer): boolean;

    // returns the nth item
    function Retrieve(n: integer): TItem;

    // returns whether list is full
    function Full: boolean;

    { gives external read-only access to FLength. This is a handy alternative
      to a getter method. You might also allow similar access to FList
      as an alternative to the Retrieve method. The principle of data-hiding
      is not broken as you can still change the internal workings.You can
      assign properties to methods as well as fields }
    property Length: integer read FLength;

  end;

implementation

{ TArrayList }

constructor TArrayList.Create;
begin
  inherited;
  FLength := 0;
end;

procedure TArrayList.Add(Item: TItem);
// adds Item to list
var
  location: integer;

begin
  if not Full then
  begin
    location := FLength;

    while ((location > 0) and (FList[location].product > Item.product)) do
      begin
        FList[location+1] := FList[location];
        dec(location);
      end;

    FList[location + 1] := Item;
    inc(FLength)
  end;

end;

function TArrayList.Remove(Item: TItem): boolean;
// removes all items that match Item, returns true if there were any
var
  location: integer;
begin
  location := 1;
  result := false;
  while location <= FLength do
  begin
    if FList[location].product = Item.product then
    begin
      Delete(location);
      result := true;
      dec(location); // to ensure that item moved up is checked for removal
    end;
    inc(location);
  end;
end;

procedure TArrayList.Delete(n: integer);
// deletes nth item
begin
  if FLength >= n then
  begin
    FList[n] := FList[FLength];
    dec(FLength);
  end;

end;

function TArrayList.Found(Item: TItem; var location: integer): boolean;
// search for Item and return whether or not it is there
// location parameter wil contain index of first match
var
  current: integer;
begin
  current := 1;
  location := 0;
  result := false;
  while (current <= FLength) and (result = false) do
  begin
    if FList[current].product = Item.product then
    begin
      result := true;
      location := current;
    end;
    inc(current);
  end;
end;

function TArrayList.Retrieve(n: integer): TItem;
// returns the nth item
begin
  if n <= FLength then
    result := FList[n]
  else
  begin
    result.product := 'Not Present';
    result.quantity := 0;
  end;

end;

function TArrayList.Full: boolean;
// returns whether list is full
begin
  result := FLength >= 100;
end;

end.
