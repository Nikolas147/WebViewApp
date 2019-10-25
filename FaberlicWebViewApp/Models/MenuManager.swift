//
//  MenuManager.swift
//  tempProject
//
//  Created by Aleksey on 24/10/2019.
//  Copyright © 2019 Aleksey. All rights reserved.
//

import Foundation

class MenuManager {
    
    static func loadData() -> [CollapsableViewModel] {
        //меню добавлено с сайта на 70%
        let data = [
            CollapsableViewModel(label: "ПРОДУКЦИЯ", image: #imageLiteral(resourceName: "arrowMenu"), children: [
                CollapsableViewModel(label: "  КОСМЕТИКА"),
                CollapsableViewModel(label: "  ПАРФЮМЕРИЯ"),
                CollapsableViewModel(label: "  ОДЕЖДА И АКСЕССУАРЫ"),
                CollapsableViewModel(label: "  ДОМ"),
                CollapsableViewModel(label: "  ЗДОРОВЬЕ", image: #imageLiteral(resourceName: "arrowMenu"), children: [
                    CollapsableViewModel(label: "   Все товары", link: "https://new.faberlic.com/ru/c/health"),
                    CollapsableViewModel(label: "   Аппараты «ДЭНАС»", link: "https://new.faberlic.com/c/denas-devices"),
                    CollapsableViewModel(label: "   Гигиена", image: #imageLiteral(resourceName: "arrowMenu"), children: [
                        CollapsableViewModel(label: "    Все товары", link: "https://new.faberlic.com/c/hygiene-products"),
                        CollapsableViewModel(label: "    Для душа и ванны", link: "https://new.faberlic.com/c/bath-accessories"),
                        CollapsableViewModel(label: "    Уход за полостью рта", link: "https://new.faberlic.com/c/oral-care-products"),
                        CollapsableViewModel(label: "    Дезодоранты", link: "https://new.faberlic.com/c/deodorants-for-hygiene"),
                        CollapsableViewModel(label: "    Интимная гигиена", link: "https://new.faberlic.com/c/intimate-hygiene-products")
                    ]),
                    CollapsableViewModel(label: "   Домашняя аптечка", link: "https://new.faberlic.com/c/medicine-chest"),
                    CollapsableViewModel(label: "   Управление весом", link: "https://new.faberlic.com/c/weight-loss-weight-gain"),
                    CollapsableViewModel(label: "   Функциональное питание", image: #imageLiteral(resourceName: "arrowMenu"), children: [
                        CollapsableViewModel(label: "    Все товары", link: "https://new.faberlic.com/c/functional-food"),
                        CollapsableViewModel(label: "    Каши", link: "https://new.faberlic.com/c/porridge-functional-food"),
                        CollapsableViewModel(label: "    Напитки", link: "https://new.faberlic.com/c/drinks-functional-food"),
                        CollapsableViewModel(label: "    Протеиновые батончики", link: "https://new.faberlic.com/c/protein-bars-functional-food"),
                        CollapsableViewModel(label: "    Супы", link: "https://new.faberlic.com/c/soups-functional-food")
                    ]),
                    CollapsableViewModel(label: "   Бальзамы и фиточай", link: "https://new.faberlic.com/c/balms-herbal-tea"),
                    CollapsableViewModel(label: "   Продукты для здоровья", link: "https://new.faberlic.com/c/health-products"),
                    CollapsableViewModel(label: "   Ортопедические товары", link: "https://new.faberlic.com/c/orthopedic-products"),
                    CollapsableViewModel(label: "   Аксессуары для спорта", link: "https://new.faberlic.com/c/sports-accessories"),
                    CollapsableViewModel(label: "   Уход за кожей", link: "https://new.faberlic.com/c/problem-sensitive-skin-care")
                    
                ]),
                
                CollapsableViewModel(label: "  ДЕТЯМ", image: #imageLiteral(resourceName: "arrowMenu"), children: [
                    CollapsableViewModel(label: "   Все товары", link: "https://new.faberlic.com/ru/c/goods-for-kids"),
                    CollapsableViewModel(label: "   Косметика", image: #imageLiteral(resourceName: "arrowMenu"), children: [
                        CollapsableViewModel(label: "    Все товары", link: "https://new.faberlic.com/c/cosmetics-for-children"),
                        CollapsableViewModel(label: "    Для кожи", link: "https://new.faberlic.com/c/baby-skin-cleansers"),
                        CollapsableViewModel(label: "    Для губ", link: "https://new.faberlic.com/c/baby-lip-makeup"),
                        CollapsableViewModel(label: "    Для ногтей", link: "https://new.faberlic.com/c/baby-products-for-nails"),
                        CollapsableViewModel(label: "    Для зубов", link: "https://new.faberlic.com/c/baby-toothpaste-toothbrush")
                    ]),
                    CollapsableViewModel(label: "   Одежда и обувь", image: #imageLiteral(resourceName: "arrowMenu"), children: [
                        CollapsableViewModel(label: "    Все товары", link: "https://new.faberlic.com/c/childrens-clothes-shoes"),
                        CollapsableViewModel(label: "    Девочкам", link: "https://new.faberlic.com/c/baby-clothes-for-girls"),
                        CollapsableViewModel(label: "    Мальчикам", link: "https://new.faberlic.com/c/baby-clothes-for-boys"),
                        CollapsableViewModel(label: "    Новорожденным", link: "https://new.faberlic.com/c/baby-clothes-for-newborns")
                    ]),
                    CollapsableViewModel(label: "   Игрушки и аксессуары", link: "https://new.faberlic.com/c/childrens-toys-accessories")
                ]),
                
                CollapsableViewModel(label: "  МУЖЧИНАМ", image: #imageLiteral(resourceName: "arrowMenu"), children: [
                    CollapsableViewModel(label: "   Все товары", link: "https://new.faberlic.com/ru/c/for-men"),
                    CollapsableViewModel(label: "   Косметика", image: #imageLiteral(resourceName: "arrowMenu"), children: [
                        CollapsableViewModel(label: "    Все товары", link: "https://new.faberlic.com/c/mens-cosmetics"),
                        CollapsableViewModel(label: "    Уход за телом и волосами", link: "https://new.faberlic.com/c/body-care-hair"),
                        CollapsableViewModel(label: "    Для и после бритья", link: "https://new.faberlic.com/c/for-after-shave"),
                        CollapsableViewModel(label: "    Дезодоранты", link: "https://new.faberlic.com/c/mens-deodorants"),
                        CollapsableViewModel(label: "    Уход за лицом", link: "https://new.faberlic.com/c/facial-care-products-for-men")
                    ]),
                    CollapsableViewModel(label: "   Парфюмерия", link: "https://new.faberlic.com/c/mens-perfume"),
                    CollapsableViewModel(label: "   Одежда и аксессуары", image: #imageLiteral(resourceName: "arrowMenu"), children: [
                        CollapsableViewModel(label: "    Все товары", link: "https://new.faberlic.com/c/mens-clothing-accessories"),
                        CollapsableViewModel(label: "    Одежда", link: "https://new.faberlic.com/c/clothes-for-men"),
                        CollapsableViewModel(label: "    Нижнее белье и носки", link: "https://new.faberlic.com/c/mens-underwear-socks"),
                        CollapsableViewModel(label: "    Аксессуары", link: "https://new.faberlic.com/c/mens-accessories"),
                        CollapsableViewModel(label: "    Обувь", link: "https://new.faberlic.com/c/shoes-for-men")
                    ])
                ]),
                
                CollapsableViewModel(label: "  ДЛЯ БИЗНЕСА", image: #imageLiteral(resourceName: "arrowMenu"), children: [
                    CollapsableViewModel(label: "   Все товары", link: "https://new.faberlic.com/ru/c/for-business"),
                    CollapsableViewModel(label: "   Каталог, прайс-лист", link: "https://new.faberlic.com/ru/c/for-business"),
                    CollapsableViewModel(label: "   Книги, брошюры, диски", link: "https://new.faberlic.com/c/books-pamphlets-discs"),
                    CollapsableViewModel(label: "   Плакаты, наклейки, календари", link: "https://new.faberlic.com/c/posters-stickers-calendars"),
                    CollapsableViewModel(label: "   Блоттеры, палитры, листовки", link: "https://new.faberlic.com/c/blotters-palette-leaflets"),
                    CollapsableViewModel(label: "   Пакеты, упаковка", link: "https://new.faberlic.com/c/packets-gift-bags"),
                    CollapsableViewModel(label: "   Тестеры", image: #imageLiteral(resourceName: "arrowMenu"), children: [
                        CollapsableViewModel(label: "    Все товары", link: "https://new.faberlic.com/c/testers"),
                        CollapsableViewModel(label: "    Ароматы", link: "https://new.faberlic.com/c/perfume-fragrance-testers"),
                        CollapsableViewModel(label: "    Для макияжа", link: "https://new.faberlic.com/c/makeup-testers"),
                        CollapsableViewModel(label: "    Для дома", link: "https://new.faberlic.com/c/home-testers")
                ])
                
                ]),
                CollapsableViewModel(label: "  АКЦИИ", link: "https://new.faberlic.com/ru/c/1?q=%3Arelevance%3AperiodShields%3Apromo")
            
            ]),
            CollapsableViewModel(label: "КОМПАНИЯ", image: #imageLiteral(resourceName: "arrowMenu"), children: [
                CollapsableViewModel(label: "  O Faberlic", link: "https://new.faberlic.com/ru/about"),
                CollapsableViewModel(label: "  Научные разработки", link: "https://new.faberlic.com/ru/scientific_development"),
                CollapsableViewModel(label: "  Собственные производство", link: "https://new.faberlic.com/ru/our_product"),
                CollapsableViewModel(label: "  Новости", link: "https://faberlic.com/index.php?option=com_content&view=newpage&layout=blog&Itemid=2090&lang=ru"),
                CollapsableViewModel(label: "  Новинки каталога", link: "https://faberlic.com/index.php?option=com_articles&view=category&id=1000289777314&lang=ru"),
                CollapsableViewModel(label: "  Контакты", link: "https://new.faberlic.com/ru/contact_us")
            ]),
            
            CollapsableViewModel(label: "СЕРВИС", image: #imageLiteral(resourceName: "arrowMenu"), children: [
                CollapsableViewModel(label: "  Как оформить заказ", link: "https://new.faberlic.com/ru/howtoaddproducttocart"),
                CollapsableViewModel(label: "  Оплата", link: "https://new.faberlic.com/ru/payment"),
                CollapsableViewModel(label: "  Доставка", link: "https://new.faberlic.com/ru/delivery"),
                CollapsableViewModel(label: "  Регистрация", link: "https://new.faberlic.com/ru/how_to_register"),
                CollapsableViewModel(label: "  Вопросы и ответы", link: "https://new.faberlic.com/ru/ask_us")
                ]),
            
            CollapsableViewModel(label: "ДОПОЛНИТЕЛЬНО", image: #imageLiteral(resourceName: "arrowMenu"), children: [
                CollapsableViewModel(label: "  Партнерство", link: "https://faberlic.com/index.php?option=com_content&view=category&layout=blog&id=379&Itemid=2507&lang=ru"),
                CollapsableViewModel(label: "  Пункты выдачи", link: "https://faberlic.com/index.php?option=com_list&view=list&listId=104&lang=ru"),
                CollapsableViewModel(label: "  Отвечают эксперты", link: "https://faberlic.com/index.php?option=com_content&view=category&layout=blog&id=263&Itemid=2356&lang=ru"),
                CollapsableViewModel(label: "  Листать каталог", link: "https://new.faberlic.com/ru/catalog/flash")
            ])
        ]
        
        return data
    }
}
