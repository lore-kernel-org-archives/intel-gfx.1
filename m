Return-Path: <SRS0=eaB6=PN=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A568AC433EF
	for <intel-gfx@archiver.kernel.org>; Mon, 25 Oct 2021 12:23:07 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B9A560EE9
	for <intel-gfx@archiver.kernel.org>; Mon, 25 Oct 2021 12:23:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6B9A560EE9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC25589ECB;
	Mon, 25 Oct 2021 12:23:06 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE6F189ECB;
 Mon, 25 Oct 2021 12:23:05 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10147"; a="210417037"
X-IronPort-AV: E=Sophos;i="5.87,180,1631602800"; d="scan'208";a="210417037"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2021 05:23:05 -0700
X-IronPort-AV: E=Sophos;i="5.87,180,1631602800"; d="scan'208";a="446208051"
Received: from vadimmik-mobl.ccr.corp.intel.com (HELO localhost)
 ([10.249.254.123])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2021 05:23:02 -0700
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <a2d6a96b3f360991511e6e4969de83cea2f5a97a.camel@linux.intel.com>
References: <20211020192147.8048-1-matthew.brost@intel.com>
 <a2d6a96b3f360991511e6e4969de83cea2f5a97a.camel@linux.intel.com>
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: daniele.ceraolospurio@intel.com, john.c.harrison@intel.com
To: Thomas Hellström <thomas.hellstrom@linux.intel.com>, Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID: <163516458029.3804.14322548249266136569@jlahtine-mobl.ger.corp.intel.com>
User-Agent: alot/0.8.1
Date: Mon, 25 Oct 2021 15:23:00 +0300
Subject: Re: [Intel-gfx] [PATCH] drm/i915/guc: Fix recursive lock in GuC
 submission
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

Quoting Thomas Hellstr=C3=B6m (2021-10-21 08:39:48)
> On Wed, 2021-10-20 at 12:21 -0700, Matthew Brost wrote:

<SNIP>

> > Fixes: 1a52faed31311 ("drm/i915/guc: Take engine PM when a context is
> > pinned with GuC submission")
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > Cc: stable@vger.kernel.org

This Cc: stable annotation is unnecessary.

Please always use "dim fixes 1a52faed31311" for helping to decide which
Cc's are needed. In this case stable is not needed. If it was, there
would be an indication of kernel version. In this case this is fine to
be picked up by in drm-intel-next-fixes PR.

Let's pay attention to the right Fixes: annotation while submitting and
reviewing patches.

Regards, Joonas
