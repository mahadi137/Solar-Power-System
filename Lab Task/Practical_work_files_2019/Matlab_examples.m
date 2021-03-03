
% Element-wise multiplication is needed when calculating power vectors
% .* or times(U,I)
P = U.*I;
P = times(U,I);

% How to plot a current–voltage curve
figure()
box on
plot(U_out,I_out, 'LineWidth',2 )
set(gca,'FontSize',32,'FontName','times new roman')
xlabel('Voltage (V)')
ylabel('Current (A)')
axis([0 35 0 9])

% How to plot a power–voltage curve
figure()
hold on
box on
grid on
plot(U_out,I_out.*U_out, 'LineWidth',3 )
set(gca,'FontSize',36,'FontName','arial')
xlabel('Voltage (V)')
ylabel('Power (W)')
axis([0 35 0 250])

% How to plot multiple curves in a single figure
figure()
hold on
box on
grid on
plot(U_out1,I_out,'g', 'LineWidth',2 )
plot(U_out2,I_out,'--r', 'LineWidth',2 )
plot(U_out3,I_out, ':', 'Color', [0 0.3 0.74], 'LineWidth',2 )
set(gca,'FontSize',32,'FontName','times new roman')
xlabel('Voltage (V)')
ylabel('Current (A)')
legend('A=1.0','A=2.0','A=3.0','Location','SouthWest');
axis([0 35 0 9])

% Trapezoidal numerical integration can be used to calculate energies
trapz(time, power)

% Other useful commands:
% clc - Clear Command Window
% clear - Remove items from workspace
% max - Largest elements in array
% help - provides help for functions in Command Window