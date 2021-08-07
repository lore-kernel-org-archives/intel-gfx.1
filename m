Return-Path: <SRS0=vq8X=M6=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C216C432BE
	for <intel-gfx@archiver.kernel.org>; Sat,  7 Aug 2021 15:21:20 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3874C60F5A
	for <intel-gfx@archiver.kernel.org>; Sat,  7 Aug 2021 15:21:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3874C60F5A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB9A78930A;
	Sat,  7 Aug 2021 15:21:18 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F3C18930A;
 Sat,  7 Aug 2021 15:21:17 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10069"; a="214242261"
X-IronPort-AV: E=Sophos;i="5.84,303,1620716400"; d="scan'208";a="214242261"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2021 08:21:16 -0700
X-IronPort-AV: E=Sophos;i="5.84,303,1620716400"; d="scan'208";a="524360428"
Received: from ideak-desk.fi.intel.com ([10.237.68.141])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2021 08:21:14 -0700
Date: Sat, 7 Aug 2021 18:21:10 +0300
From: Imre Deak <imre.deak@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: linux-fbdev@vger.kernel.org, Kai-Heng Feng <kai.heng.feng@canonical.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>, intel-gfx@lists.freedesktop.org
Message-ID: <20210807152110.GA2390730@ideak-desk.fi.intel.com>
References: <20210802133551.1904964-1-imre.deak@intel.com>
 <YQsTWSGIgY00XEU7@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YQsTWSGIgY00XEU7@phenom.ffwll.local>
Subject: Re: [Intel-gfx] [PATCH] fbdev/efifb: Release PCI device's runtime
 PM ref during FB destroy
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

On Thu, Aug 05, 2021 at 12:23:21AM +0200, Daniel Vetter wrote:
> On Mon, Aug 02, 2021 at 04:35:51PM +0300, Imre Deak wrote:
> > Atm the EFI FB driver gets a runtime PM reference for the associated GFX
> > PCI device during driver probing and releases it only when removing the
> > driver.
> > 
> > When fbcon switches to the FB provided by the PCI device's driver (for
> > instance i915/drmfb), the EFI FB will get only unregistered without the
> > EFI FB driver getting unloaded, keeping the runtime PM reference
> > acquired during driver probing. This reference will prevent the PCI
> > driver from runtime suspending the device.
> > 
> > Fix this by releasing the RPM reference from the EFI FB's destroy hook,
> > called when the FB gets unregistered.
> > 
> > Fixes: a6c0fd3d5a8b ("efifb: Ensure graphics device for efifb stays at PCI D0")
> > Cc: Kai-Heng Feng <kai.heng.feng@canonical.com>
> > Signed-off-by: Imre Deak <imre.deak@intel.com>
> 
> Patch looks good:
> 
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> 
> But I've found a bunch of ordering issues here:
> - we should probably get the runtime pm reference _before_ we register the
>   framebuffer. There's a race right now about there.

Yea, missed this will send a v2 moving it earlier.

> - the sysfs_remove_groups and framebuffer_release should also be moved
>   into the destroy callback. This is more a leak type of situation.

Those sysfs entries belong to the efifb platform device, showing the
bootup screen_info.lfb_* info, not related to fb_info, so imo
efifb_remove() is the correct place to remove those. But yes, freeing
fb_info seems to belong to fb_destroy().

Atm, things will blow up when unbinding the efifb device after the efifb
framebuffer was unregistered while removing it as a conflicting FB
(since unregister_framebuffer() will be called twice), so that would
need to be solved as well. Maybe remove_conflicting_pci_framebuffers()
could unregister the platform device instead of only unregistering the
framebuffer, similarly to drm_aperture_detach_firmware(), but haven't
checked this in more detail.

> Cheers, Daniel
> 
> > ---
> >  drivers/video/fbdev/efifb.c | 8 +++++---
> >  1 file changed, 5 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/video/fbdev/efifb.c b/drivers/video/fbdev/efifb.c
> > index 8ea8f079cde26..25cdea32b9633 100644
> > --- a/drivers/video/fbdev/efifb.c
> > +++ b/drivers/video/fbdev/efifb.c
> > @@ -47,6 +47,8 @@ static bool use_bgrt = true;
> >  static bool request_mem_succeeded = false;
> >  static u64 mem_flags = EFI_MEMORY_WC | EFI_MEMORY_UC;
> >  
> > +static struct pci_dev *efifb_pci_dev;	/* dev with BAR covering the efifb */
> > +
> >  static struct fb_var_screeninfo efifb_defined = {
> >  	.activate		= FB_ACTIVATE_NOW,
> >  	.height			= -1,
> > @@ -243,6 +245,9 @@ static inline void efifb_show_boot_graphics(struct fb_info *info) {}
> >  
> >  static void efifb_destroy(struct fb_info *info)
> >  {
> > +	if (efifb_pci_dev)
> > +		pm_runtime_put(&efifb_pci_dev->dev);
> > +
> >  	if (info->screen_base) {
> >  		if (mem_flags & (EFI_MEMORY_UC | EFI_MEMORY_WC))
> >  			iounmap(info->screen_base);
> > @@ -333,7 +338,6 @@ ATTRIBUTE_GROUPS(efifb);
> >  
> >  static bool pci_dev_disabled;	/* FB base matches BAR of a disabled device */
> >  
> > -static struct pci_dev *efifb_pci_dev;	/* dev with BAR covering the efifb */
> >  static struct resource *bar_resource;
> >  static u64 bar_offset;
> >  
> > @@ -603,8 +607,6 @@ static int efifb_remove(struct platform_device *pdev)
> >  	unregister_framebuffer(info);
> >  	sysfs_remove_groups(&pdev->dev.kobj, efifb_groups);
> >  	framebuffer_release(info);
> > -	if (efifb_pci_dev)
> > -		pm_runtime_put(&efifb_pci_dev->dev);
> >  
> >  	return 0;
> >  }
> > -- 
> > 2.27.0
> > 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
