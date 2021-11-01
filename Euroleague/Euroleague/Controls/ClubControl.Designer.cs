
namespace Euroleague.Controls
{
    partial class ClubControl
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
            this.lbClubName = new System.Windows.Forms.Label();
            this.pbClub = new System.Windows.Forms.PictureBox();
            ((System.ComponentModel.ISupportInitialize)(this.pbClub)).BeginInit();
            this.SuspendLayout();
            // 
            // lbClubName
            // 
            this.lbClubName.AutoSize = true;
            this.lbClubName.Location = new System.Drawing.Point(47, 135);
            this.lbClubName.Name = "lbClubName";
            this.lbClubName.Size = new System.Drawing.Size(85, 17);
            this.lbClubName.TabIndex = 1;
            this.lbClubName.Text = "sdgafhererh";
            this.lbClubName.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            this.lbClubName.Click += new System.EventHandler(this.ClubControl_Click);
            // 
            // pbClub
            // 
            this.pbClub.BackColor = System.Drawing.SystemColors.ActiveCaptionText;
            this.pbClub.Location = new System.Drawing.Point(50, 11);
            this.pbClub.Name = "pbClub";
            this.pbClub.Size = new System.Drawing.Size(115, 105);
            this.pbClub.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.pbClub.TabIndex = 0;
            this.pbClub.TabStop = false;
            this.pbClub.Click += new System.EventHandler(this.ClubControl_Click);
            // 
            // ClubControl
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.SystemColors.ControlDark;
            this.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.Controls.Add(this.lbClubName);
            this.Controls.Add(this.pbClub);
            this.Name = "ClubControl";
            this.Size = new System.Drawing.Size(212, 168);
            this.Click += new System.EventHandler(this.ClubControl_Click);
            ((System.ComponentModel.ISupportInitialize)(this.pbClub)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.PictureBox pbClub;
        private System.Windows.Forms.Label lbClubName;
    }
}
