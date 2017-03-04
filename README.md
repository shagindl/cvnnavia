#Предложения по решению заданий от **cnnavia**.
**Задание №1**  
Архитектура блока генерации тестовой последовательности при реализации на FPGA показано на рисунке [Задание №1 Архитектура блока TestSeq](https://www.draw.io/?lightbox=1&highlight=0000ff&edit=_blank&layers=1&nav=1&title=%D0%97%D0%B0%D0%B4%D0%B0%D0%BD%D0%B8%D0%B5%20%E2%84%961%20%D0%90%D1%80%D1%85%D0%B8%D1%82%D0%B5%D0%BA%D1%82%D1%83%D1%80%D0%B0%20%D0%B1%D0%BB%D0%BE%D0%BA%D0%B0%20TestSeq#Uhttps%3A%2F%2Fraw.githubusercontent.com%2Fshagindl%2Fcvnnavia-interview%2Fmaster%2F%25D0%2597%25D0%25B0%25D0%25B4%25D0%25B0%25D0%25BD%25D0%25B8%25D0%25B5%2520%25E2%2584%25961%2520%25D0%2590%25D1%2580%25D1%2585%25D0%25B8%25D1%2582%25D0%25B5%25D0%25BA%25D1%2582%25D1%2583%25D1%2580%25D0%25B0%2520%25D0%25B1%25D0%25BB%25D0%25BE%25D0%25BA%25D0%25B0%2520TestSeq).  
Внешний интерфейс для заполнения памяти блока **TestSeq** на языке *System Verilog* можно использовать стандартный для применяемого **CPU** в *FPGA*.  
На примере решения от ALtera с CPU Nios 2 урезанный интерфейс Avalon-MM: 
 
---
    interface intf_slv #(
        parameter WADDR_SLV =       8,
        parameter SLV_WIDTH_DATA =  32
    )(
   		input wire [(WADDR_SLV - 1) : 0]  address,
		input wire [(SLV_WIDTH_DATA - 1) : 0] wrdata,
		output wire [(SLV_WIDTH_DATA - 1) : 0] rddata,
		input wire write, read
	);
  
	    modport slv_TestSeq(
		  input address, wrdata, read 
		); 
    endinterface  

---

**Задание №2**  
Реализация фильтра по данной задачи находится в  
[\\cvnnavia-interview\\task_2\\src\\](https://github.com/shagindl/cvnnavia-interview/tree/master/task_2/src) файл *task_2.sv*.  
Testbench расположен в [\\cvnnavia-interview\\task_2\\tb\\](https://github.com/shagindl/cvnnavia-interview/tree/master/task_2/tb) файл *tb_task_2.sv*.  
![Рисунок](https://github.com/shagindl/cvnnavia-interview/blob/master/task_2/vsim_image.jpg)
