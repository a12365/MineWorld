use std.textio.all;

entity Hello is
end Hello;

architecture Hello_Arch of Hello is
begin
       p : process
       variable l:line;
       begin
               write(l, String'("Hello, world!"));
               writeline(output, l);
               wait;
       end process;
end Hello_Arch;