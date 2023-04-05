using ModelTrade.Model;
using ModelTrade.View;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using ModelTrade;


namespace ModelTrade
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

       

        private void Btn_Click(object sender, RoutedEventArgs e)
            
        {
            using (var db = new TradeEntities())
            {
                var CurrentUser = db.User.FirstOrDefault(u => u.UserLogin == txbLogin.Text && u.UserPassword == txPassword.Password);

                if (CurrentUser != null)
                {

                    WelcomeWindow WelcomeWindow = new WelcomeWindow();
                    WelcomeWindow.Show();
                    this.Hide();
                }
                else
                {
                    MessageBox.Show("Данного пользователя нет в базе");
                }
            }


            
        }
        
    }
}
