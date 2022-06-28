with Ada.Text_IO,
     Pancake;
use  Ada.Text_IO,
     Pancake;

procedure Main is
    List_A : Natural_Array := (5, 2, 7, 9, 3, 6, 8);
    List_B : Natural_Array := (9, 2, 1, 8, 4, 5);

    procedure Put_Line (Item : in Natural_Array) is
    begin
        for I of Item loop
            Put (I'Image);
        end loop;
        New_Line;
    end Put_Line;
begin
    Put_Line("--- Orig ---");
    Put_Line(List_A);
    Put_Line(List_B);
    Swap_List (List_A);
    Swap_List (List_B);
    Put_Line("--- Swap ---");
    Put_Line(List_A);
    Put_Line(List_B);
    Sort (List_A);
    Sort (List_B);
    Put_Line("--- Sort ---");
    Put_Line(List_A);
    Put_Line(List_B);
end Main;