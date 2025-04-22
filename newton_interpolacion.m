function [y_interp, err_pct] = newton_interpolacion(x, y, x_interp, y_real)
    n = length(x);
    DD = zeros(n, n);
    DD(:,1) = y(:); % primera columna con y

    for j = 2:n
        for i = 1:(n-j+1)
            DD(i,j) = (DD(i+1,j-1) - DD(i,j-1)) / (x(i+j-1) - x(i));
        end
    end

    % Evaluación del polinomio de Newton
    y_interp = DD(1,1);
    mult = 1;
    for j = 1:n-1
        mult = mult * (x_interp - x(j));
        y_interp = y_interp + DD(1,j+1) * mult;
    end

    if nargin == 4
        err_pct = abs((y_interp - y_real)/y_real)*100;
    else
        err_pct = NaN;
    end
end
