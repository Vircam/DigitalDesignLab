-- standart 4 bit giri?li 7 bit çik??l?
-- Giris(ler): A(4 bit), B(7 bit, test için kar??ya iletildi?i dü?ünülen)
-- Cikis(lar): F(7 bit, hesaplanan), S(3 bit, hamming hata bulma bitleri)
-- ödev: en az 3 kez farkl? bitleri bozarak hata düzeltme gerçekle?tiriniz.
-- G-15 Mart 2022
---------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

Entity eHam is
port (	                                                              --        a6a5a4 a3a2a1a0
        A: in std_logic_vector(3 downto 0);	-- 4 bit veri,        örn: 1110 ->        1 1 1 0
        fA: out std_logic_vector(6 downto 0); --                               0 1 0  1 1 1 0 
		    B: in std_logic_vector(6 downto 0);	-- 7 bit test verisi, örn:      -> 0 1 0  1 1 0 0, a1 bozulmu? olsun
		    Fb: out std_logic_vector(6 downto 0);-- 7 bit  A çikisi	     :      -> 0 0 1  1 1 0 0, hesaplana
		    S: out std_logic_vector(2 downto 0)  --                      :      -> 0 1 1         
		                                                                    --     s6s5s4   (s4s5s6)=(110)    , a1'e denk geliyor
	);
End Entity;


Architecture behv of 	eHam is
signal 	C: std_logic_vector(6 downto 0);   -- Code = veri + hamming 
Begin
		fA(3 downto 0) <= A; -- ilk 4 bit A'n?n ayn?s?
		fA(4) <= A(0) xor A(1) xor A(2); -- Hamming
		fA(5) <= A(1) xor A(2) xor A(3);
		fA(6) <= A(2) xor A(3) xor A(0);
		C(0) <= B(0);
		C(1) <= B(1);
		C(2) <= B(2);
		C(3) <= B(3);
		C(4) <= B(0) xor B(1) xor B(2) ;	-- Hamming code
		C(5) <= B(1) xor B(2) xor B(3) ;
		C(6) <= B(2) xor B(3) xor B(0) ;
		Fb <= C; 		-- hesaplanan code cikisa aktarildi
		
		-- hata kodu
		S(2) <=  C(6) xor B(6);	-- S6 
		S(1) <=  C(5) xor B(5); -- S5
		S(0) <=  C(4) xor B(4);	-- S4	
End behv;
