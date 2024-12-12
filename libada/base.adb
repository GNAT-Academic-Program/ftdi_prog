with Ada.Text_IO; use Ada.Text_IO;

package body Base is

   subtype FT_Status is Interfaces.C.unsigned_long;
   subtype DWORD is Interfaces.C.unsigned;
   type LP_DWORD is access all DWORD;



   function Get_App_Header return ICS.chars_ptr is
      App_Header : String := "----------------------------------" & ASCII.LF &
                             "             FLEXRISCV            " & ASCII.LF&
                             "----------------------------------" & ASCII.LF;
   begin
      return ICS.New_String (App_Header);
   end;

   function List_FTDI_Devices return ICS.chars_ptr is
      function FT_Create_Device_Info_List (Num_Devs : LP_DWORD) return FT_Status
      with Import, Convention => C, External_Name => "FT_CreateDeviceInfoList";

      Num_Devices : aliased DWORD := 1000;
      Result      : FT_Status := FT_Create_Device_Info_List (Num_Devices'Unchecked_Access);
      Str : String := "Number of devices: " & Num_Devices'Image & ASCII.LF;
   begin
      return ICS.New_String (Str);
   end;
end Base;