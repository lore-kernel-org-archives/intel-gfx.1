Return-Path: <SRS0=q0LQ=O3=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD62FC433EF
	for <intel-gfx@archiver.kernel.org>; Thu,  7 Oct 2021 13:05:29 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 773E561139
	for <intel-gfx@archiver.kernel.org>; Thu,  7 Oct 2021 13:05:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 773E561139
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sig21.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21C7E6F474;
	Thu,  7 Oct 2021 13:05:29 +0000 (UTC)
Received: from mail.sig21.net (mail.sig21.net [217.197.84.222])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 248ED6F475;
 Thu,  7 Oct 2021 13:05:27 +0000 (UTC)
Received: from localhorst ([127.0.0.1])
 by mail.sig21.net with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <js@sig21.net>)
 id 1mYT4q-0004YS-DS ; Thu, 07 Oct 2021 15:04:48 +0200
Received: from js by abc.local with local (Exim 4.95)
 (envelope-from <js@sig21.net>) id 1mYT4V-0004mR-3n;
 Thu, 07 Oct 2021 15:04:27 +0200
Date: Thu, 7 Oct 2021 15:04:27 +0200
From: Johannes Stezenbach <js@sig21.net>
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Message-ID: <YV7wW+RxKzJVn6Uf@sig21.net>
References: <YV6hBl5ybMxm5Dln@sig21.net> <YV7qVorGtO5NHKkC@intel.com>
 <4d93315b-d370-c178-7c68-3dce1c95b42f@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4d93315b-d370-c178-7c68-3dce1c95b42f@redhat.com>
Subject: Re: [Intel-gfx] [bisected] suspend broken by DRM fbdev name change
 on i915 IVB
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

Hi Javier,

On Thu, Oct 07, 2021 at 03:01:46PM +0200, Javier Martinez Canillas wrote:
> Yes, the change was just cosmetic because we had confusing names such as
> "simpledrmdrmfb". When it was proposed, the agreement was that /proc/fb
> shouldn't be considered an ABI but now we found that people are using it.
> 
> So I agree that would be better to revert this patch. Johannes, will you
> post a revert or do you want me to do it ?

Please do it.

Thanks,
Johannes
