//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import Rswift
import UIKit

/// This `R` struct is generated and contains references to static resources.
struct R: Rswift.Validatable {
  fileprivate static let applicationLocale = hostingBundle.preferredLocalizations.first.flatMap(Locale.init) ?? Locale.current
  fileprivate static let hostingBundle = Bundle(for: R.Class.self)
  
  static func validate() throws {
    try intern.validate()
  }
  
  /// This `R.color` struct is generated, and contains static references to 0 colors.
  struct color {
    fileprivate init() {}
  }
  
  /// This `R.file` struct is generated, and contains static references to 0 files.
  struct file {
    fileprivate init() {}
  }
  
  /// This `R.font` struct is generated, and contains static references to 0 fonts.
  struct font {
    fileprivate init() {}
  }
  
  /// This `R.image` struct is generated, and contains static references to 1 images.
  struct image {
    /// Image `iconLogo`.
    static let iconLogo = Rswift.ImageResource(bundle: R.hostingBundle, name: "iconLogo")
    
    /// `UIImage(named: "iconLogo", bundle: ..., traitCollection: ...)`
    static func iconLogo(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.iconLogo, compatibleWith: traitCollection)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.nib` struct is generated, and contains static references to 3 nibs.
  struct nib {
    /// Nib `DialogOneButtonViewController`.
    static let dialogOneButtonViewController = _R.nib._DialogOneButtonViewController()
    /// Nib `MoviesCollectionViewCell`.
    static let moviesCollectionViewCell = _R.nib._MoviesCollectionViewCell()
    /// Nib `MoviesViewController`.
    static let moviesViewController = _R.nib._MoviesViewController()
    
    /// `UINib(name: "DialogOneButtonViewController", in: bundle)`
    static func dialogOneButtonViewController(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.dialogOneButtonViewController)
    }
    
    /// `UINib(name: "MoviesCollectionViewCell", in: bundle)`
    static func moviesCollectionViewCell(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.moviesCollectionViewCell)
    }
    
    /// `UINib(name: "MoviesViewController", in: bundle)`
    static func moviesViewController(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.moviesViewController)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.reuseIdentifier` struct is generated, and contains static references to 0 reuse identifiers.
  struct reuseIdentifier {
    fileprivate init() {}
  }
  
  /// This `R.segue` struct is generated, and contains static references to 0 view controllers.
  struct segue {
    fileprivate init() {}
  }
  
  /// This `R.storyboard` struct is generated, and contains static references to 1 storyboards.
  struct storyboard {
    /// Storyboard `LaunchScreen`.
    static let launchScreen = _R.storyboard.launchScreen()
    
    /// `UIStoryboard(name: "LaunchScreen", bundle: ...)`
    static func launchScreen(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.launchScreen)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.string` struct is generated, and contains static references to 1 localization tables.
  struct string {
    /// This `R.string.localizable` struct is generated, and contains static references to 18 localization keys.
    struct localizable {
      /// Value: E-mail
      static let emailTextFieldPlaceholder = Rswift.StringResource(key: "EmailTextFieldPlaceholder", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Entrar
      static let loginButton = Rswift.StringResource(key: "LoginButton", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Error
      static let errorMessageComment = Rswift.StringResource(key: "ErrorMessageComment", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Informe seu nome de usuário.
      static let loginUsernameInvalid = Rswift.StringResource(key: "LoginUsernameInvalid", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Informe sua senha.
      static let loginPasswordInvalid = Rswift.StringResource(key: "LoginPasswordInvalid", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Método não permitido
      static let methodNotAllowed = Rswift.StringResource(key: "MethodNotAllowed", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Não foi encontrado nenhum resultado
      static let notFoundError = Rswift.StringResource(key: "NotFoundError", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Não foi possível identificar a causa do erro no servidor, ele pode estar temporariamente indisponível.
      static let errorMessageGeneric = Rswift.StringResource(key: "ErrorMessageGeneric", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Não foi possível obter o usuário logado.
      static let loggedUserError = Rswift.StringResource(key: "LoggedUserError", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Não reconhecemos seu usuário.
      static let loginUserNotFound = Rswift.StringResource(key: "LoginUserNotFound", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: O servidor com o nome do host especificado não pôde ser encontrado
      static let domainError = Rswift.StringResource(key: "DomainError", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: OK
      static let buttonOK = Rswift.StringResource(key: "ButtonOK", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Recuperar Senha
      static let recoveryPassword = Rswift.StringResource(key: "RecoveryPassword", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Senha
      static let passwordTextFieldPlaceholder = Rswift.StringResource(key: "PasswordTextFieldPlaceholder", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Sua sessão expirou, por favor acesse o aplicativo novamente!
      static let invalidToken = Rswift.StringResource(key: "InvalidToken", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Tempo limite de conexão excedido
      static let connectionExpired = Rswift.StringResource(key: "ConnectionExpired", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Usuário e senha são obrigatórios.
      static let loginUsernamePasswordInvalid = Rswift.StringResource(key: "LoginUsernamePasswordInvalid", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Verifique sua conexão com a internet
      static let noInternet = Rswift.StringResource(key: "NoInternet", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      
      /// Value: E-mail
      static func emailTextFieldPlaceholder(_: Void = ()) -> String {
        return NSLocalizedString("EmailTextFieldPlaceholder", bundle: R.hostingBundle, comment: "")
      }
      
      /// Value: Entrar
      static func loginButton(_: Void = ()) -> String {
        return NSLocalizedString("LoginButton", bundle: R.hostingBundle, comment: "")
      }
      
      /// Value: Error
      static func errorMessageComment(_: Void = ()) -> String {
        return NSLocalizedString("ErrorMessageComment", bundle: R.hostingBundle, comment: "")
      }
      
      /// Value: Informe seu nome de usuário.
      static func loginUsernameInvalid(_: Void = ()) -> String {
        return NSLocalizedString("LoginUsernameInvalid", bundle: R.hostingBundle, comment: "")
      }
      
      /// Value: Informe sua senha.
      static func loginPasswordInvalid(_: Void = ()) -> String {
        return NSLocalizedString("LoginPasswordInvalid", bundle: R.hostingBundle, comment: "")
      }
      
      /// Value: Método não permitido
      static func methodNotAllowed(_: Void = ()) -> String {
        return NSLocalizedString("MethodNotAllowed", bundle: R.hostingBundle, comment: "")
      }
      
      /// Value: Não foi encontrado nenhum resultado
      static func notFoundError(_: Void = ()) -> String {
        return NSLocalizedString("NotFoundError", bundle: R.hostingBundle, comment: "")
      }
      
      /// Value: Não foi possível identificar a causa do erro no servidor, ele pode estar temporariamente indisponível.
      static func errorMessageGeneric(_: Void = ()) -> String {
        return NSLocalizedString("ErrorMessageGeneric", bundle: R.hostingBundle, comment: "")
      }
      
      /// Value: Não foi possível obter o usuário logado.
      static func loggedUserError(_: Void = ()) -> String {
        return NSLocalizedString("LoggedUserError", bundle: R.hostingBundle, comment: "")
      }
      
      /// Value: Não reconhecemos seu usuário.
      static func loginUserNotFound(_: Void = ()) -> String {
        return NSLocalizedString("LoginUserNotFound", bundle: R.hostingBundle, comment: "")
      }
      
      /// Value: O servidor com o nome do host especificado não pôde ser encontrado
      static func domainError(_: Void = ()) -> String {
        return NSLocalizedString("DomainError", bundle: R.hostingBundle, comment: "")
      }
      
      /// Value: OK
      static func buttonOK(_: Void = ()) -> String {
        return NSLocalizedString("ButtonOK", bundle: R.hostingBundle, comment: "")
      }
      
      /// Value: Recuperar Senha
      static func recoveryPassword(_: Void = ()) -> String {
        return NSLocalizedString("RecoveryPassword", bundle: R.hostingBundle, comment: "")
      }
      
      /// Value: Senha
      static func passwordTextFieldPlaceholder(_: Void = ()) -> String {
        return NSLocalizedString("PasswordTextFieldPlaceholder", bundle: R.hostingBundle, comment: "")
      }
      
      /// Value: Sua sessão expirou, por favor acesse o aplicativo novamente!
      static func invalidToken(_: Void = ()) -> String {
        return NSLocalizedString("InvalidToken", bundle: R.hostingBundle, comment: "")
      }
      
      /// Value: Tempo limite de conexão excedido
      static func connectionExpired(_: Void = ()) -> String {
        return NSLocalizedString("ConnectionExpired", bundle: R.hostingBundle, comment: "")
      }
      
      /// Value: Usuário e senha são obrigatórios.
      static func loginUsernamePasswordInvalid(_: Void = ()) -> String {
        return NSLocalizedString("LoginUsernamePasswordInvalid", bundle: R.hostingBundle, comment: "")
      }
      
      /// Value: Verifique sua conexão com a internet
      static func noInternet(_: Void = ()) -> String {
        return NSLocalizedString("NoInternet", bundle: R.hostingBundle, comment: "")
      }
      
      fileprivate init() {}
    }
    
    fileprivate init() {}
  }
  
  fileprivate struct intern: Rswift.Validatable {
    fileprivate static func validate() throws {
      // There are no resources to validate
    }
    
    fileprivate init() {}
  }
  
  fileprivate class Class {}
  
  fileprivate init() {}
}

struct _R {
  struct nib {
    struct _DialogOneButtonViewController: Rswift.NibResourceType {
      let bundle = R.hostingBundle
      let name = "DialogOneButtonViewController"
      
      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [NSObject : AnyObject]? = nil) -> UIKit.UIView? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? UIKit.UIView
      }
      
      fileprivate init() {}
    }
    
    struct _MoviesCollectionViewCell: Rswift.NibResourceType {
      let bundle = R.hostingBundle
      let name = "MoviesCollectionViewCell"
      
      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [NSObject : AnyObject]? = nil) -> MoviesCollectionViewCell? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? MoviesCollectionViewCell
      }
      
      fileprivate init() {}
    }
    
    struct _MoviesViewController: Rswift.NibResourceType {
      let bundle = R.hostingBundle
      let name = "MoviesViewController"
      
      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [NSObject : AnyObject]? = nil) -> UIKit.UIView? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? UIKit.UIView
      }
      
      fileprivate init() {}
    }
    
    fileprivate init() {}
  }
  
  struct storyboard {
    struct launchScreen: Rswift.StoryboardResourceWithInitialControllerType {
      typealias InitialController = UIKit.UIViewController
      
      let bundle = R.hostingBundle
      let name = "LaunchScreen"
      
      fileprivate init() {}
    }
    
    fileprivate init() {}
  }
  
  fileprivate init() {}
}
