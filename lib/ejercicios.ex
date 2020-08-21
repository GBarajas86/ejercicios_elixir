defmodule Ejercicios do
  @moduledoc """
  Documentation for `Ejercicios`.
  """

  @doc """
  1.-Función para calcular el factorial de N (N!=1·2·3·...·N)
  """

  def fact(0), do: 1
  def fact(n), do: n * fact(n - 1)

  @doc """
  2.-Función que determine si la cadena que se ingresa es un palíndromo.
    ej: “radar” -> Si es palíndromo
  """

  def palindromo?(word) do
    if word === String.reverse(word) do
      true
    else
      false
    end
  end

  @doc """
  3.-Función que dado un número N, genere una lista de longitud  N
    con elementos aleatorios, posteriormente calcular los números primos
    que existan en dicha lista.
  """

  def is_prime(num) do
    list = for i <- 1..num  do
      if Integer.mod(num, i) == 0 do
        "ok"
      end
    end

    divisor = Enum.count(list, fn x -> x == "ok" end)

    if divisor == 2 do
      true
    else
      false
    end
  end

  @doc """

  	4.-Un año es bisiesto si es múltiplo de 4, exceptuando los múltiplos de 100,
    que sólo son bisiestos cuando son múltiplos además de 400, por ejemplo el año 1900 no fue bisiesto,
    pero el año 2000 sí lo será. Hacer una función que dado un año A nos diga si es o no bisiesto.
  """
  def anio_bisiesto(year) do
    if (rem(year, 4) == 0 and rem(year, 100) !== 0) or
         (rem(year, 100) == 0 and rem(year, 400) == 0) do
      IO.puts("#{year} es bisiesto")
    else
      IO.puts("#{year} no es bisiesto")
    end
  end

  @moduledoc """
      5.-Función para sumar los N primeros términos de una progresión geométrica de primer término A y razón R.
   •	Nota: Una progresión geométrica es una sucesión de números reales llamados términos, en la que cada término se obtiene multiplicando el término anterior por una constante denominada razón o factor de la progresión.
   •	Término n de la progresión Geométrica
   •	Suma de las n de la progresión Geométrica
   •	ej: Hallar el 5to término y la suma de los 8 primeros términos de la progresión
  """

  @moduledoc """
      6.-La sucesión de Fibonacci se define de la siguiente forma:
       a1=1, a2=1 y an=an-1+an-2 para n>2, es decir los dos primeros son 1
       y el resto cada uno es la suma de los dos anteriores,
       los primeros son: 1, 1, 2, 3, 5, 8, 13, 21, ...
        Hacer una función para calcular el Nésimo término de la sucesión.
  """
  def fib(0), do: 0
  def fib(1), do: 1

  def fib(n) do
    fib(n - 1) + fib(n - 2)
  end

  @moduledoc """
    7.- Dados dos números enteros positivos N y D, se dice que D es un divisor de N
    si el resto de dividir N entre D es 0. Se dice que un número N es perfecto si la suma
    de sus divisores (excluido el propio N) es N. Por ejemplo 28 es perfecto,
    pues sus divisores (excluido el 28) son: 1, 2, 4, 7 y 14 y su suma es 1+2+4+7+14=28.
     Hacer función que dado un número N nos diga si es o no perfecto.
  """

  @doc """
    8.-Función que lea una lista de N elementos y calcule la suma de los pares e impares.
  """

  def suma_pares(list) do
    IO.puts("suma pares: #{Enum.sum(Enum.filter(list, fn x -> rem(x, 2) == 0 end))}")
    IO.puts("suma impares: #{Enum.sum(Enum.filter(list, fn x -> rem(x, 2) !== 0 end))}")
  end

  @doc """
   9.- Función para obtener el mayor y el total de números negativos de una lista de N elementos.
  """

  def mayor_total_negativos do
    lista = [1, 2, 3, -3, -2, -1]
    IO.puts("el numero mayor es #{Enum.max(lista)}")
    IO.puts("el total de numeros negativos es #{Enum.count(lista, fn x -> x < 0 end)}")
  end

  @doc """
   10.-Función para obtener el tamaño (N) de la lista e imprimir N veces. Ejemplo: N=7
  """

  def imprime_n_veces(word) do
    lista = String.codepoints(word)
    IO.puts("longitud: #{length(lista)}")
    List.duplicate(lista, length(lista))
  end

  @doc """
   11.- Función para ordenar una lista de N elementos de forma ascendente y descendente.
  """
  def ordena_asc_desc(lista) do
    IO.inspect(Enum.sort(lista, :asc))
    IO.inspect(Enum.sort(lista, :desc))
  end

  @doc """
   12.- Función que dado una lista de N elementos se calcule el promedio, media y moda.
  """

  def calcular_promedio_media_moda(lista) do
    IO.puts("promedio: #{Enum.sum(lista) / length(lista)}")
  end

  @doc """
         13.- •	Hared tiene 24 años y su código postal es 11320, crear una módulo para obtener la etapa en la que se encuentra y conocer la ciudad a la que pertenece.
       Etapas:
         •	Niño 6 a 11 años
         •	Adolecente 12 a 18 años
         •	Juventud 18 a 26 años
         •	Adulto 27 a 59 años
         •	Persona Mayor 60 en adelante

       Código postal -> ciudad
         •	70000 -> H. CD. Juchitán de Zaragoza
         •	11320 -> Ciudad de México
         •	70110 -> CD. Ixtepec

       Nota: Hacer uso de un mapa, solo pueden utilizar un cond ó case, no se permiten if, obligatoriamente usar el pattern matching.
  """

  def calcula_etapa_ciudad(%{edad: edad, cp: cp} = p) do
    cond do
      p.edad >= 6 and p.edad <= 11 ->
        IO.puts("es solo un Niño")
        get_adress(p.cp)

      p.edad >= 12 and p.edad <= 18 ->
        IO.puts("aun es un Adolescente")
        get_adress(p.cp)

      p.edad >= 18 and p.edad <= 26 ->
        IO.puts("juventud, divino tesoro")
        get_adress(p.cp)

      p.edad >= 27 and p.edad <= 59 ->
        IO.puts("Adulto...")
        get_adress(p.cp)

      p.edad > 60 ->
        IO.puts("Vejez")
        get_adress(p.cp)
    end
  end

  defp get_adress(70000 = cp) do
    "Es de Juchitan"
  end

  defp get_adress(70110 = cp) do
    "Es de Ixtepec"
  end

  defp get_adress(11320 = cp) do
    "Es de Cdmx"
  end

  @doc """
   14.- Realizar la actualización del campo de precio de un producto utilizando listas de mapas:
   ej. estructura: sku: 87504, nombre: “aceite”, cantidad: 4, precio: 24.00; sku: 97453, nombre: “azúcar”, cantidad: 4, precio: 15.50; sku: 53421, nombre: “cafe”, cantidad: 4, precio: 6.80.

  """

  def update_map(%{"update_precio" => precio}) do
    map1 = %{sku: 87504, nombre: "aceite", cantidad: 4, precio: 24.00}

    params = %{
      precio: precio
    }

    Map.merge(map1, params)
  end

  @doc """
   15.- Una empresa paga a sus 3 trabajadores semanalmente, de acuerdo con el número de horas trabajadas,
   a razón de $12.80 pesos por hora. Hacer un módulo que dado el número de horas trabajadas,
   calcular el salario total que le corresponde a cada trabajador. Utilizar una lista de mapas.

  ej: get_salary([%{name: "fulanito", hrs: 40, total: 0}, %{name: "benito", hrs: 42, total: 0},
  %{name: "pedro", hrs: 36 total: 0}]) -> [%{name: "fulanito", hrs: 40, total: 512},
  %{name: "benito", hrs: 42, total: 537.6}, %{name: "pedro", hrs: 36 total: 460.80}]
  """
  def get_salary do
    empleados = [
      %{name: "jon mircha", hrs: 25, total: 25},
      %{name: "Juan Diaz", hrs: 30, total: 30},
      %{name: "jesus Valencia", hrs: 20, total: 20}
    ]

    all = fn :get_and_update, data, next ->
      data |> Enum.map(next) |> Enum.unzip()
    end

    get_and_update_in(empleados, [all, :total], &{&1, &1 *12.80})

  end
end
