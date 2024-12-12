with Interfaces.C;
with Interfaces.C.Strings;

package Base is
   package IC renames Interfaces.C;
   Package ICS renames Interfaces.C.Strings;

   function Get_App_Header return ICS.chars_ptr
   with
       Export        => True,
       Convention    => C,
       External_Name => "get_app_header";

   function List_FTDI_Devices return ICS.chars_ptr
   with
       Export        => True,
       Convention    => C,
       External_Name => "list_ftdi_devices";

end Base;