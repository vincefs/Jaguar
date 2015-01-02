//
//  Todo.h
//  Jaguar
//
//  Created by Vinícius Sposito on 1/2/15.
//  Copyright (c) 2015 Rebel Cookie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Todo : NSObject

// Isso ta uma bagunca, explicando:
// Essa classe serve para ambos os tipos de todo, e cada todo nao pode ter qualquer coisa da lista acima
// sendo o titulo obrigatorio.
// A classe MovingTodo necessita de um titulo, um nivel de importancia e uma data. Por isso,
// os metodos de init dela correspondem a essas necessidades.

/* Lista de coisas quem ambos os todos tem:
 Titulo
 Notas(opcional)
 URL(opcional)
 
 Ideias(ignorar por enquanto):
 contato(opcional)
 projeto(opcional)
 */

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *notes;
@property (strong, nonatomic) NSURL *URL;

- (instancetype)initWithTitle:(NSString *)aTitle; // For todos that do not have anything but a title
- (instancetype)initWithTitle:(NSString *)aTitle notes:(NSString *)aNote;
- (instancetype)initWithTitle:(NSString *)aTitle notes:(NSString *)aNote URL:(NSURL *)aURL;

@end
