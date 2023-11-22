module pff;

reg clk1;
reg clk2;
reg wea;
reg [3:0] addra;
reg [3:0] addrb;
reg [3:0] dia;
reg [3:0] dib;
reg web;
wire [3:0] doa;
wire [3:0] dob;
raminfr uut (
    .clk1(clk1),
    .clk2(clk2),
    .wea(wea),
    .addra(addra),
    .addrb(addrb),
    .dia(dia),
    .dib(dib),
    .web(web),
    .doa(doa),
    .dob(dob)
);

initial begin

    clk1 = 0;
    clk2 = 0;
    wea = 0;
    web = 0;
    addra = 0;
    addrb = 0;
    dia = 0;
    dib = 0;

    forever begin
        #3 clk1=~clk1;
        #1 clk2=~clk2;
    end
end

initial begin
    wea=1;
    web=1;
    addrb=4'd7;
    addra=4'd6;
    dia=4'ha;
    dib=4'hb;
    #5
    dia=4'hc;
    dib=4'hd;

    #10
    wea=0;
    web=0;
    addra=4'd6;
    addrb=4'd7;
    dia=4'ha;
    dib=4'hb;
    #5
    dia=4'hc;
    dib=4'hd;

    #10
    wea=1;
    web=0;
    addra=4'd2;
    addrb=4'd9;
    dia=4'h0;
    dib=4'h1;

    #10
    wea=0;
    web=1;
    addra=4'd2;
    addrb=4'd9;
    dia=4'h0;
    dib=4'h1;
    #10 $finish;
end

initial begin
    $dumpfile("bleh.vcd");
    $dumpvars(0,pff);
end


endmodule
