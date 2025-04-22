x = [7, 10, 13, 16, 19];
y = [14, 21, 28, 30, 28];

x_interp = 11;

y_real = [23.71]; 

if isempty(y_real)
    [y_interp, err_pct] = newton_interpolacion(x, y, x_interp);
else
    [y_interp, err_pct] = newton_interpolacion(x, y, x_interp, y_real);
end

fprintf('Valor interpolado en x = %.2f: %.4f\n', x_interp, y_interp);
if ~isnan(err_pct)
    fprintf('Error porcentual: %.2f%%\n', err_pct);
end
