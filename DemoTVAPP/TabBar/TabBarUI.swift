//
//  TabBarUI.swift
//  TvApp
//
//  Created by Ilgiz Fazlyev on 09.02.2021.
//

import UIKit

extension TabBarView: UITabBarControllerDelegate {
    
    func configUI() {


        let browse = BrowseView(nibName: "BrowseView", bundle: nil)
        browse.tabBarItem.title = "Browse"
        let favorites = FavoritesView(nibName: "FavoritesView", bundle: nil)
        favorites.title = "Favorites"
        let settings = SettingsView(nibName: "SettingsView", bundle: nil)
        settings.title = "Settings"
        let search = SearchView(nibName: "SearchView", bundle: nil)
        search.tabBarItem.image = #imageLiteral(resourceName: "serchTabIcon")
        
        viewControllers = [browse,favorites,settings,search]

        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIConstants.Colors.white100], for:.normal)

        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIConstants.Colors.grey100], for:.focused)
        
        let appearance = UITabBarAppearance()
            appearance.backgroundColor = UIConstants.Colors.white20
            tabBar.standardAppearance = appearance
        
        configAppearence(tabBar.standardAppearance.compactInlineLayoutAppearance)
        configAppearence(tabBar.standardAppearance.inlineLayoutAppearance)
        configAppearence(tabBar.standardAppearance.stackedLayoutAppearance)
        
    }
    
    private func configAppearence(_ itemAppearance: UITabBarItemAppearance){
        itemAppearance.normal.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIConstants.Colors.white100]
        itemAppearance.normal.iconColor = UIConstants.Colors.white100
        
        itemAppearance.focused.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIConstants.Colors.grey100]
        itemAppearance.focused.iconColor = UIConstants.Colors.grey100
        
        itemAppearance.selected.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIConstants.Colors.white100]
        itemAppearance.selected.iconColor = UIConstants.Colors.white100
    }
    
    func tabBarController(_ tabBarController: UITabBarController, animationControllerForTransitionFrom fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return TabBarAnimatedTransitioning()
    }
}
