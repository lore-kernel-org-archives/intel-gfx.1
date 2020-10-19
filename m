Return-Path: <SRS0=HG+d=D2=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35285C433DF
	for <intel-gfx@archiver.kernel.org>; Mon, 19 Oct 2020 18:33:51 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4FDCA2231B
	for <intel-gfx@archiver.kernel.org>; Mon, 19 Oct 2020 18:33:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4FDCA2231B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8260A6EA30;
	Mon, 19 Oct 2020 18:33:48 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D18166EA30;
 Mon, 19 Oct 2020 18:33:46 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 22760069-1500050 for multiple; Mon, 19 Oct 2020 19:33:33 +0100
MIME-Version: 1.0
In-Reply-To: <20201019182936.GA3149316@intel.com>
References: <20201006145632.117291-1-srinivasx.k@intel.com>
 <2f7809798dd0b59246d67c5044dafb1e518fc4c5.camel@intel.com>
 <160200650945.2919.11750150118902885340@build.alporthouse.com>
 <3CDB63EE-D1CD-43E4-A977-4E966CD19313@intel.com>
 <c88bc0fbc4956395324674ca202b395326208888.camel@intel.com>
 <BYAPR11MB3014087624B8206C05362830F9080@BYAPR11MB3014.namprd11.prod.outlook.com>
 <B6C174E8-161A-43BD-AFDA-21C94F6D56E3@intel.com>
 <BY5PR11MB44341733BF4A7CCB79861322F6080@BY5PR11MB4434.namprd11.prod.outlook.com>
 <BYAPR11MB30149153D9229142DD2CF96BF9020@BYAPR11MB3014.namprd11.prod.outlook.com>
 <20201019182936.GA3149316@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
To: "K, SrinivasX" <srinivasx.k@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Date: Mon, 19 Oct 2020 19:33:32 +0100
Message-ID: <160313241261.4425.3184593266306110227@build.alporthouse.com>
User-Agent: alot/0.9
Subject: Re: [Intel-gfx] [PATCH] drm/i915/ehl: Remove require_force_probe
 protection
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
Cc: "Pandey, Hariom" <hariom.pandey@intel.com>, "Nikula,
 Jani" <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Quoting Rodrigo Vivi (2020-10-19 19:29:36)
> 
> I just checked the CI picture and it looks much better indeed.
> 
> Only bad case being the gt_pm, which is also failing on other platforms.

Not nearly in the same manner. CI is indicating that there is no RC6
entry and no power saving at all; neither in the selftests nor visible
from userspace. That is a critical battery eating bug.

If there's a patch to fix it for ehl and jsl, send it to CI for proving.
-Chris
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
