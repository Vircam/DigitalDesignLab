------------------------------------
--Tek Eslik bitini hesaplayan devre
--Giris bitleri: A
--Çikis bitleri: F
------------------------------------

library IEEE;

use IEEE.std_logic_1164.all;

entity eTekParity is
  port (
    A: In std_logic_vector(6 downto 0); -- 7 bitlik veri girisi
    F: Out std_logic_vector(7 downto 0) --tek parity biti eklenmis verinin son hali
  );
End entity;

architecture behv of eTekParity is
signal cS: std_logic;
begin
  cS <= not(A(6) xor A(5) xor A(4) xor A(3) xor A(2) xor A(1) xor A(0)); --checksum'in degili
  F <= A & cS; --concatenation
end behv;