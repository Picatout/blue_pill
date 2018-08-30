\ some definitions by PICATOUT
\ revision 2018-08-28

\ STM32C8T6 flash size
$10000 constant FLASHSIZE

 \ how many flash bytes free
: flash-free ( -- u )
  FLASHSIZE compiletoram? if compiletoflash here - compiletoram
  else here - then ;

\ how many RAM bytes free
: ram-free ( -- u )
  flashvar-here compiletoram? if here - 
  else compiletoram here - compiletoflash then ;

\ power of 2
: pwr2 ( u -- 2^u )
  1 swap lshift ;
  
\ print in binary
: bin. base @ swap binary u. swap base ! ;
    
\ extract bit field
\ u1 integer to extract from
\ p 0-31 position
\ w 1-31 field width
: bitfield ( u1 p w -- u2 )  
	>r rshift r> pwr2 mod ;
	
\ how many definitions in dictionary
: wc ( -- u )
	0 dictionarystart begin 
	swap 1+ swap 
	dictionarynext until
	drop ;
	
