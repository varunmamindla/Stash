//
//  UIViewController+Extension.swift
//  Stash
//
//  Created by Varun Mamindla on 4/18/21.
//

import UIKit

extension UIViewController {
    public class var defaultNibName: String {
        return String(describing: self)
    }
}

public enum DefaultNib {
    public static func viewController<T: UIViewController>() -> T {
        return T(nibName: T.defaultNibName, bundle: Bundle(for: T.self))
    }
}
