Return-Path: <SRS0=81md=OW=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A379C433F5
	for <intel-gfx@archiver.kernel.org>; Sat,  2 Oct 2021 12:17:59 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA5E561B02
	for <intel-gfx@archiver.kernel.org>; Sat,  2 Oct 2021 12:17:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DA5E561B02
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 296DA6E843;
	Sat,  2 Oct 2021 12:17:54 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FE396E840;
 Sat,  2 Oct 2021 12:17:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B56A661B00;
 Sat,  2 Oct 2021 12:17:52 +0000 (UTC)
Date: Sat, 2 Oct 2021 08:17:50 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Hugh Dickins <hughd@google.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>, Matt Roper
 <matthew.d.roper@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Caz Yokoyama
 <caz.yokoyama@intel.com>, LKML <linux-kernel@vger.kernel.org>, Linus
 Torvalds <torvalds@linux-foundation.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Matthew Brost <matthew.brost@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Message-ID: <20211002081750.7eec92dd@oasis.local.home>
In-Reply-To: <259ff554-76b8-8523-033-9e996f549c70@google.com>
References: <20211002020257.34a0e882@oasis.local.home>
 <259ff554-76b8-8523-033-9e996f549c70@google.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-gfx] [BUG 5.15-rc3] kernel BUG at
 drivers/gpu/drm/i915/i915_sw_fence.c:245!
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

On Sat, 2 Oct 2021 03:17:29 -0700 (PDT)
Hugh Dickins <hughd@google.com> wrote:

> Yes (though bisection doesn't work right on this one): the fix

Interesting, as it appeared to be very reliable. But I didn't do the
"try before / after" on the patch.

> https://lore.kernel.org/lkml/1f955bff-fd9e-d2ee-132a-f758add9e9cb@google.com/
> seems to have got lost in the system: it has not even appeared in
> linux-next yet. I was going to send a reminder later this weekend.
> 
> Here it is again (but edited to replace "__aligned(4)" in the original
> by the official "__i915_sw_fence_call" I discovered afterwards; and
> ignoring recent discussions of where __attributes ought to appear :-)
> 
> 
> [PATCH] drm/i915: fix blank screen booting crashes

Thanks, I added it to my "fixes" patch set that I apply before testing.
It looks to have done the trick, and the kernel boots now.

Tested-by: Steven Rostedt (VMware) <rostedt@goodmis.org>

-- Steve

