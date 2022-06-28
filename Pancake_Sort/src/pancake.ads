pragma SPARK_Mode (On);

package Pancake is

    type Natural_Array is array (Positive range <>) of Natural with
        Dynamic_Predicate => Natural_Array'Length >= 1;

    procedure Sort (List : in out Natural_Array) with
        Pre => List'First < List'Last,
        Post => (for all I in List'First.. List'Last - 1 => List (I) >= List (I + 1));

-- private

    function Index_Of_Max (List : in Natural_Array) return Positive with
        Post => Index_Of_Max'Result in List'Range
            and then (for all I in List'Range => List (I) <= List (Index_Of_Max'Result))
            and then (for all I in List'First .. Index_Of_Max'Result - 1=> List (I) < List (Index_Of_Max'Result));

    procedure Swap_List (List : in out Natural_Array) with
        Post => (for all I in List'Range => List (I) = List'Old (List'Last - (I - List'First)));

    procedure Swap_Element (List : in out Natural_Array; Element_A, Element_B : in Positive) with
        Pre => Element_A in List'Range
            and then Element_B in List'Range,
        Post => List (Element_A) = List'Old (Element_B)
            and then List (Element_B) = List'Old (Element_A)
            and then (for all I in List'Range => (if I /= Element_A and I /= Element_B then List (I) = List'Old (I)));

end Pancake;