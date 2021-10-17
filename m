Return-Path: <SRS0=ZH9c=PF=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6A65C433F5
	for <intel-gfx@archiver.kernel.org>; Sun, 17 Oct 2021 20:04:01 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6827F60FDC
	for <intel-gfx@archiver.kernel.org>; Sun, 17 Oct 2021 20:04:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6827F60FDC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2C3B6E027;
	Sun, 17 Oct 2021 20:04:00 +0000 (UTC)
Received: from bmailout3.hostsharing.net (bmailout3.hostsharing.net
 [IPv6:2a01:4f8:150:2161:1:b009:f23e:0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 240256E027;
 Sun, 17 Oct 2021 20:04:00 +0000 (UTC)
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "*.hostsharing.net",
 Issuer "RapidSSL TLS DV RSA Mixed SHA256 2020 CA-1" (verified OK))
 by bmailout3.hostsharing.net (Postfix) with ESMTPS id DD8E6100CF137;
 Sun, 17 Oct 2021 22:03:55 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
 id BC299233EA6; Sun, 17 Oct 2021 22:03:55 +0200 (CEST)
Date: Sun, 17 Oct 2021 22:03:55 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Nirmoy Das <nirmoy.das@amd.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <20211017200355.GA3480@wunner.de>
References: <20211013183601.16514-1-nirmoy.das@amd.com>
 <20211013183601.16514-4-nirmoy.das@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211013183601.16514-4-nirmoy.das@amd.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Intel-gfx] [PATCH v2 4/4] vgaswitcheroo: do not check for NULL
 debugfs dentry
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel graphics driver community testing & development
 <intel-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Wed, Oct 13, 2021 at 08:36:01PM +0200, Nirmoy Das wrote:
> Debugfs APIs returns encoded error on failure so use
> debugfs_lookup() instead of checking for NULL.

The commit message no longer matches up with the patch itself
(debugfs_lookup() isn't called).

My suggestion would be something like:

  Retry creation of the vga_switcheroo debugfs if a previous
  invocation of debugfs_create_dir() returned an error code.

With that addressed,
Reviewed-by: Lukas Wunner <lukas@wunner.de>

Thanks,

Lukas

> Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
> ---
>  drivers/gpu/vga/vga_switcheroo.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/vga/vga_switcheroo.c b/drivers/gpu/vga/vga_switcheroo.c
> index 365e6ddbe90f..07ab8d85e899 100644
> --- a/drivers/gpu/vga/vga_switcheroo.c
> +++ b/drivers/gpu/vga/vga_switcheroo.c
> @@ -914,7 +914,7 @@ static void vga_switcheroo_debugfs_fini(struct vgasr_priv *priv)
>  static void vga_switcheroo_debugfs_init(struct vgasr_priv *priv)
>  {
>  	/* already initialised */
> -	if (priv->debugfs_root)
> +	if (priv->debugfs_root && !IS_ERR(priv->debugfs_root))
>  		return;
> 
>  	priv->debugfs_root = debugfs_create_dir("vgaswitcheroo", NULL);
> --
> 2.32.0
