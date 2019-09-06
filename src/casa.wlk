import cosas.* 

object casa {
	const cosas = []
	
	var property tipoCuenta = cuentaCorriente
	
	method comprar(cosa) {
		tipoCuenta.extraer(cosa.precio())
		cosas.add(cosa)
		}
	
	method cosas(){ return cosas }
	
	method cambiaCuenta(cuenta){ tipoCuenta = cuenta }
	
	method queFaltaComprar(lista){
		return lista.asSet().difference(cosas.asSet())
		
	}
		
	method comprarLoQueFalta(lista){
		
	const listaFaltantes = self.queFaltaComprar(lista)
	
	listaFaltantes.forEach({ producto => self.comprar(producto)} )
	
	}

	
}

object cuentaCorriente{
	
	var saldoLocal = 0 
	
	method saldo(){ return saldoLocal }
	
	method depositar(importe){ saldoLocal = saldoLocal + importe  }
	
	method extraer(importe){ 
		if (saldoLocal >= importe){
			saldoLocal = saldoLocal - importe
		}   else self.error("Saldo insuficiente")
	}
}
