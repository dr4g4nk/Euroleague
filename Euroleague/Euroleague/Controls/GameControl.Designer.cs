
namespace Euroleague.Controls
{
    partial class GameControl
    {
        /// <summary> 
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary> 
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Component Designer generated code

        /// <summary> 
        /// Required method for Designer support - do not modify 
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.panel2 = new System.Windows.Forms.Panel();
            this.lbGuest = new System.Windows.Forms.Label();
            this.lbHome = new System.Windows.Forms.Label();
            this.lbGuestPTS = new System.Windows.Forms.Label();
            this.lbHomePTS = new System.Windows.Forms.Label();
            this.lbRoundDate = new System.Windows.Forms.Label();
            this.pbGuest = new System.Windows.Forms.PictureBox();
            this.pbHome = new System.Windows.Forms.PictureBox();
            this.panel2.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pbGuest)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.pbHome)).BeginInit();
            this.SuspendLayout();
            // 
            // panel2
            // 
            this.panel2.BackColor = System.Drawing.SystemColors.ControlDark;
            this.panel2.Controls.Add(this.lbGuest);
            this.panel2.Controls.Add(this.lbHome);
            this.panel2.Controls.Add(this.lbGuestPTS);
            this.panel2.Controls.Add(this.lbHomePTS);
            this.panel2.Controls.Add(this.lbRoundDate);
            this.panel2.Controls.Add(this.pbGuest);
            this.panel2.Controls.Add(this.pbHome);
            this.panel2.Dock = System.Windows.Forms.DockStyle.Fill;
            this.panel2.Location = new System.Drawing.Point(0, 0);
            this.panel2.Name = "panel2";
            this.panel2.Size = new System.Drawing.Size(222, 234);
            this.panel2.TabIndex = 9;
            this.panel2.Click += new System.EventHandler(this.panel_Click);
            // 
            // lbGuest
            // 
            this.lbGuest.AutoSize = true;
            this.lbGuest.Location = new System.Drawing.Point(3, 202);
            this.lbGuest.Name = "lbGuest";
            this.lbGuest.Size = new System.Drawing.Size(0, 17);
            this.lbGuest.TabIndex = 6;
            this.lbGuest.Click += new System.EventHandler(this.panel_Click);
            // 
            // lbHome
            // 
            this.lbHome.AutoSize = true;
            this.lbHome.Location = new System.Drawing.Point(3, 103);
            this.lbHome.Name = "lbHome";
            this.lbHome.Size = new System.Drawing.Size(0, 17);
            this.lbHome.TabIndex = 5;
            this.lbHome.Click += new System.EventHandler(this.panel_Click);
            // 
            // lbGuestPTS
            // 
            this.lbGuestPTS.AutoSize = true;
            this.lbGuestPTS.Location = new System.Drawing.Point(121, 151);
            this.lbGuestPTS.Name = "lbGuestPTS";
            this.lbGuestPTS.Size = new System.Drawing.Size(0, 17);
            this.lbGuestPTS.TabIndex = 4;
            this.lbGuestPTS.Click += new System.EventHandler(this.panel_Click);
            // 
            // lbHomePTS
            // 
            this.lbHomePTS.AutoSize = true;
            this.lbHomePTS.Location = new System.Drawing.Point(121, 47);
            this.lbHomePTS.Name = "lbHomePTS";
            this.lbHomePTS.Size = new System.Drawing.Size(0, 17);
            this.lbHomePTS.TabIndex = 3;
            this.lbHomePTS.Click += new System.EventHandler(this.panel_Click);
            // 
            // lbRoundDate
            // 
            this.lbRoundDate.AutoSize = true;
            this.lbRoundDate.Location = new System.Drawing.Point(3, 14);
            this.lbRoundDate.Name = "lbRoundDate";
            this.lbRoundDate.Size = new System.Drawing.Size(0, 17);
            this.lbRoundDate.TabIndex = 2;
            // 
            // pbGuest
            // 
            this.pbGuest.BackColor = System.Drawing.SystemColors.ActiveCaptionText;
            this.pbGuest.Location = new System.Drawing.Point(6, 134);
            this.pbGuest.Name = "pbGuest";
            this.pbGuest.Size = new System.Drawing.Size(55, 55);
            this.pbGuest.SizeMode = System.Windows.Forms.PictureBoxSizeMode.CenterImage;
            this.pbGuest.TabIndex = 1;
            this.pbGuest.TabStop = false;
            this.pbGuest.Click += new System.EventHandler(this.panel_Click);
            // 
            // pbHome
            // 
            this.pbHome.BackColor = System.Drawing.SystemColors.ActiveCaptionText;
            this.pbHome.Location = new System.Drawing.Point(6, 34);
            this.pbHome.Name = "pbHome";
            this.pbHome.Size = new System.Drawing.Size(55, 55);
            this.pbHome.SizeMode = System.Windows.Forms.PictureBoxSizeMode.CenterImage;
            this.pbHome.TabIndex = 0;
            this.pbHome.TabStop = false;
            this.pbHome.Click += new System.EventHandler(this.panel_Click);
            // 
            // GameControl
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.panel2);
            this.Name = "GameControl";
            this.Size = new System.Drawing.Size(222, 234);
            this.panel2.ResumeLayout(false);
            this.panel2.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pbGuest)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.pbHome)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Panel panel2;
        private System.Windows.Forms.Label lbRoundDate;
        private System.Windows.Forms.PictureBox pbGuest;
        private System.Windows.Forms.PictureBox pbHome;
        private System.Windows.Forms.Label lbGuestPTS;
        private System.Windows.Forms.Label lbHomePTS;
        private System.Windows.Forms.Label lbGuest;
        private System.Windows.Forms.Label lbHome;
    }
}
