pragma SPARK_Mode (On);

package body Pancake is

    procedure Sort (List : in out Natural_Array) is
        Max : Natural;
    begin
        for I in List'Range loop
            Max := Index_Of_Max (List (I .. List'Last));
            Swap_List (List (Max .. List'Last));
            Swap_List (List (I .. List'Last));
            pragma Loop_Invariant (for all X in List'Range => (if X <= I then List (X) >= List(I) else List (X) <= List (I)));
            pragma Loop_Invariant (for all X in List'First .. I - 1 => List (X) >= List (X + 1));
        end loop;
    end Sort;


    function Index_Of_Max (List : in Natural_Array) return Positive is
        Max : Positive := List'First;
    begin
        for I in List'Range loop
            if List (I) > List (Max) then
                Max := I;
            end if;
            pragma Loop_Invariant (Max in List'Range);
            pragma Loop_Invariant (for all X in List'First .. I => List (X) <= List (Max));
            pragma Loop_Invariant (for all X in List'First .. Max - 1 => List (X) < List (Max));
        end loop;
        return Max;
    end Index_Of_Max;

    procedure Swap_List (List : in out Natural_Array) is
    begin
        for I in 0 .. (List'Length / 2 - 1) loop
            Swap_Element (List, List'First + I, List'Last - I);
            pragma Loop_Invariant (for all X in List'First + I + 1.. List'Last - I - 1=> List (X) = List'Loop_Entry (X));
            pragma Loop_Invariant (for all X in List'First .. List'First + I => List (X) = List'Loop_Entry (List'Last - (X - List'First)));
            pragma Loop_Invariant (for all X in List'Last - I .. List'Last => List (X) = List'Loop_Entry (List'First + (List'Last - X)));
        end loop;
    end Swap_List;

    procedure Swap_Element (List : in out Natural_Array; Element_A, Element_B : in Positive) is
        Temp : Natural;
    begin
        Temp := List (Element_A);
        List (Element_A) := List (Element_B);
        List (Element_B) := Temp;
    end Swap_Element;

end Pancake;