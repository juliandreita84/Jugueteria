package com.jugueteria.processor;

import org.apache.camel.Exchange;
import org.apache.camel.Processor;

import com.jugueteria.model.PrcGestionaCotizacionElement;

public class MyProcessor implements Processor {

	public void process(Exchange exchange) throws Exception {
		PrcGestionaCotizacionElement prcGestionaCotizacionElement = exchange.getIn().getBody(PrcGestionaCotizacionElement.class);
		exchange.getIn().setBody(prcGestionaCotizacionElement);
	}

}