-------------------------------
--Standard 3 girisli VE kapisi
--Girisler: a, b, c
--Cikislar: d
--G-15 Mart 2022
-------------------------------
library IEEE;

use IEEE.std_logic_1164.all;

--eAnd, tasarlanan elemanin adi
entity eAND is
port (
  a: In std_logic;
  b: In std_logic;
  c: In std_logic;
  d: Out std_logic
  );
end entity;

Architecture eAND_Behv of eAND is
signal s: std_logic; -- a ve b girisinin AND kapisindan geçisinden sonraki olusacak ara deger
begin
  s <= a and b;
  d <= s and c;
End eAND_Behv;
