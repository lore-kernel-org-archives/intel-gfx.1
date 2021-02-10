Return-Path: <SRS0=KPZb=HM=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F6C9C433E0
	for <intel-gfx@archiver.kernel.org>; Wed, 10 Feb 2021 12:50:02 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87DF964E32
	for <intel-gfx@archiver.kernel.org>; Wed, 10 Feb 2021 12:50:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 87DF964E32
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EBC76E06B;
	Wed, 10 Feb 2021 12:50:01 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 738416E06B
 for <intel-gfx@lists.freedesktop.org>; Wed, 10 Feb 2021 12:49:59 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.69.177; 
Received: from localhost (unverified [78.156.69.177]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 23833492-1500050 for multiple; Wed, 10 Feb 2021 12:48:30 +0000
MIME-Version: 1.0
In-Reply-To: <02fd493c-957f-890d-d0ad-ebd4119f55f2@redhat.com>
References: <fe6040b5-72a0-9882-439e-ea7fc0b3935d@redhat.com>
 <161282685855.9448.10484374241892252440@build.alporthouse.com>
 <f1070486-891a-8ec0-0390-b9aeb03178ce@redhat.com>
 <161291205642.6673.10994709665368036431@build.alporthouse.com>
 <02fd493c-957f-890d-d0ad-ebd4119f55f2@redhat.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hans de Goede <hdegoede@redhat.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, stable@vger.kernel.org
Date: Wed, 10 Feb 2021 12:48:32 +0000
Message-ID: <161296131275.7731.862746142230006325@build.alporthouse.com>
User-Agent: alot/0.9
Subject: Re: [Intel-gfx] [5.10.y regression] i915 clear-residuals mitigation
 is causing gfx issues
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Quoting Hans de Goede (2021-02-10 10:37:19)
> Hi,
> 
> On 2/10/21 12:07 AM, Chris Wilson wrote:
> > Quoting Hans de Goede (2021-02-09 11:46:46)
> >> Hi,
> >>
> >> On 2/9/21 12:27 AM, Chris Wilson wrote:
> >>> Quoting Hans de Goede (2021-02-08 20:38:58)
> >>>> Hi All,
> >>>>
> >>>> We (Fedora) have been receiving reports from multiple users about gfx issues / glitches
> >>>> stating with 5.10.9. All reporters are users of Ivy Bridge / Haswell iGPUs and all
> >>>> reporters report that adding i915.mitigations=off to the cmdline fixes things, see:
> >>>
> >>> I tried to reproduce this on the w/e on hsw-gt1, to no avail; and piglit
> >>> did not report any differences with and without mitigations. I have yet
> >>> to test other platforms. So I don't yet have an alternative.
> >>
> >> Note the original / first reporter of:
> >>
> >> https://bugzilla.redhat.com/show_bug.cgi?id=1925346
> >>
> >> Is using hsw-gt2, so it seems that the problem is not just the enabling of
> >> the mitigations on ivy-bridge / bay-trail but that there actually is
> >> a regression on devices where the WA worked fine before...
> > 
> > There have been 3 crashes uploaded related to v5.10.9, and in all 3
> > cases the ACTHD has been in the first page. This strongly suggests that
> > the w/a is scribbling over address 0. And there's then a very good
> > chance that
> > 
> > commit 29d35b73ead4e41aa0d1a954c9bfbdce659ec5d6
> > Author: Chris Wilson <chris@chris-wilson.co.uk>
> > Date:   Mon Jan 25 12:50:33 2021 +0000
> > 
> >     drm/i915/gt: Always try to reserve GGTT address 0x0
> >     
> >     commit 489140b5ba2e7cc4b853c29e0591895ddb462a82 upstream.
> > 
> > in v5.10.14 is sufficient to hide the issue.
> 
> That one actually is already in v5.10.13 and the various reportes of these
> issues have already tested 5.10.13. They did mention that it took longer
> to reproduce with 5.10.13 then with 5.10.10, but that could also be due to:
> 
> "drm/i915/gt: Clear CACHE_MODE prior to clearing residuals"
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=linux-5.10.y&id=520d05a77b2866eb4cb9e548e1d8c8abcfe60ec5

Started looking for scratch page overwrites, and found this little gem:
https://patchwork.freedesktop.org/patch/420436/?series=86947&rev=1

Looks promising wrt the cause of overwriting random addresses -- and
I hope that is the explanation for the glitches/hangs. I have a hsw gt2
with gnome shell, piglit is happy, but I suspect it is all due to
placement and so will only occur at random.
-Chris
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
