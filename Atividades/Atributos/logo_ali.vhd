entity logo_ali is
	port
	(
		aqui	: in bit;
		ali, acola	: out bit
	);
end entity; 


architecture ixtepo of logo_ali is
	signal a, b: bit;
	attribute keep : boolean;
	attribute keep of a, b : signal is true;
begin
	ali <= (not aqui);
	a <= not aqui;
	b <= not a;
	acola <= not b;
end architecture;
