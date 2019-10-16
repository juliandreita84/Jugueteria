package com.fiduprod.processor;

import org.apache.camel.Exchange;
import org.apache.camel.Processor;

import com.fiduprod.model.PrcInsertaFdTmovimientoElement;

public class MyProcessor implements Processor {

	public void process(Exchange exchange) throws Exception {
		PrcInsertaFdTmovimientoElement prcInsertaFdTmovimientoElement = exchange.getIn().getBody(PrcInsertaFdTmovimientoElement.class);
		exchange.getIn().setBody(prcInsertaFdTmovimientoElement);
	}

}