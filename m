Return-Path: <SRS0=PnqF=LJ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E324C48BDF
	for <intel-gfx@archiver.kernel.org>; Tue, 15 Jun 2021 14:09:43 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2201761450
	for <intel-gfx@archiver.kernel.org>; Tue, 15 Jun 2021 14:09:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2201761450
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F01089C13;
	Tue, 15 Jun 2021 14:09:42 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC4CA89C13;
 Tue, 15 Jun 2021 14:09:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A68E36140B;
 Tue, 15 Jun 2021 14:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1623766181;
 bh=OMsydzJ7/CusvrwDxbCYLQi8oWAlMaMW3Xt8gZ1etAs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Wm7A40d50+9VaKpz9XYeeOgBpJDmnTp0hAVk/RetFskhy4Bt2EBQaahKocXC4SMI3
 TVyoOTrEHU8DMYX62jKtl/LHOdlSxwZS7LUXDJB9zkQ3BVrZHrX9k5/QWdGufMHOmB
 QJBNHz/SjGTIx/pWmk0IewhuVqH4Alwo17ezCNW8=
Date: Tue, 15 Jun 2021 16:09:39 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Cornelia Huck <cohuck@redhat.com>
Message-ID: <YMi0o6iG/+BbPPO4@kroah.com>
References: <20210615133519.754763-1-hch@lst.de>
 <20210615133519.754763-3-hch@lst.de> <8735tjxmhh.fsf@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8735tjxmhh.fsf@redhat.com>
Subject: Re: [Intel-gfx] [PATCH 02/10] driver core: Better distinguish probe
 errors in really_probe
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
Cc: kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Kirti Wankhede <kwankhede@nvidia.com>, Christoph Hellwig <hch@lst.de>,
 linux-s390@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Jason Gunthorpe <jgg@nvidia.com>, intel-gfx@lists.freedesktop.org,
 Jason Herne <jjherne@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Tony Krowiak <akrowiak@linux.ibm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Tue, Jun 15, 2021 at 03:53:46PM +0200, Cornelia Huck wrote:
> On Tue, Jun 15 2021, Christoph Hellwig <hch@lst.de> wrote:
> 
> > really_probe tries to special case errors from ->probe, but due to all
> > other initialization added to the function over time now a lot of
> > internal errors hit that code path as well.  Untangle that by adding
> > a new probe_err local variable and apply the special casing only to
> > that.
> >
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> > ---
> >  drivers/base/dd.c | 72 +++++++++++++++++++++++++++--------------------
> >  1 file changed, 42 insertions(+), 30 deletions(-)
> >
> > diff --git a/drivers/base/dd.c b/drivers/base/dd.c
> > index 7477d3322b3a..fd83817240e6 100644
> > --- a/drivers/base/dd.c
> > +++ b/drivers/base/dd.c
> > @@ -513,12 +513,44 @@ static ssize_t state_synced_show(struct device *dev,
> >  }
> >  static DEVICE_ATTR_RO(state_synced);
> >  
> > +
> > +static int call_driver_probe(struct device *dev, struct device_driver *drv)
> > +{
> > +	int ret = 0;
> > +
> > +	if (dev->bus->probe)
> > +		ret = dev->bus->probe(dev);
> > +	else if (drv->probe)
> > +		ret = drv->probe(dev);
> > +
> > +	switch (ret) {
> > +	case 0:
> > +		break;
> > +	case -EPROBE_DEFER:
> > +		/* Driver requested deferred probing */
> > +		dev_dbg(dev, "Driver %s requests probe deferral\n", drv->name);
> > +		break;
> > +	case -ENODEV:
> > +	case -ENXIO:
> > +		pr_debug("%s: probe of %s rejects match %d\n",
> > +			 drv->name, dev_name(dev), ret);
> > +		break;
> > +	default:
> > +		/* driver matched but the probe failed */
> > +		pr_warn("%s: probe of %s failed with error %d\n",
> > +			drv->name, dev_name(dev), ret);
> 
> Convert these two pr_* to dev_* when touching the code anyway?

It can wait, it's just moving code around for now.

thanks,

greg k-h
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
