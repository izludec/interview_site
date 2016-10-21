package com.izludec.interview.service;
 

import org.telegram.telegrambots.TelegramBotsApi;
import org.telegram.telegrambots.api.methods.send.SendMessage;
import org.telegram.telegrambots.api.objects.Update;
import org.telegram.telegrambots.bots.TelegramLongPollingBot;

 
public class TelegramBot extends TelegramLongPollingBot {
    
    private static boolean created=false;

        public TelegramBot() {
        TelegramBotsApi telegramBotsApi = new TelegramBotsApi();
		try {
                    if(created){
			telegramBotsApi.registerBot(new TelegramBot());
                        created = true;}
		} catch (Exception e) {			
		}
        
        }
 
	@Override
	public String getBotUsername() {
		return logins.USERNAME;
	}
 
	@Override
	public String getBotToken() {
		return logins.TOKEN;
	}
 
	@Override
	public void onUpdateReceived(Update update) {
		
	}
 
	public void sendMsg(String text) {         
                try {
		SendMessage sendMessage = new SendMessage();
		sendMessage.enableMarkdown(true);
		sendMessage.setChatId(logins.CHATID);
               if(text.length()>100)text="Запуск";
		sendMessage.setText(text);
			sendMessage(sendMessage);
		} catch (Exception e) {
			
		}
	}
 
}