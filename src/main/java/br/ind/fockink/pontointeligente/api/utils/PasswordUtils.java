package br.ind.fockink.pontointeligente.api.utils;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class PasswordUtils {
	private static final Logger log = LoggerFactory.getLogger(PasswordUtils.class);
	
	public PasswordUtils() {		
	}
	
	/**
	 * Gera um hasch utilizando o BCrypt
	 * 
	 * @param senha
	 * @return
	 */
	public static String geraBCrypt(String senha) {
		if(senha == null) {
			return senha;
		}
		
		log.info("Gerando hasch com BCrypt.");
		BCryptPasswordEncoder bCryptEnconder = new BCryptPasswordEncoder();
		return bCryptEnconder.encode(senha);
	}
	
	/**
	 * Verifica se a senha é válida.
	 *
	 * @param senha
	 * @param senhaEncoded
	 * @return boolean
	 */
	public static boolean senhaValida(String senha, String senhaEncoded) {
		BCryptPasswordEncoder bCryptEncoder = new BCryptPasswordEncoder();
		return bCryptEncoder.matches(senha, senhaEncoded);
	}
}
