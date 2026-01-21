Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55F5DD46940
	for <intel-gfx@archiver.kernel.org>; Wed, 21 Jan 2026 14:53:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF3B610E84F;
	Wed, 21 Jan 2026 14:53:43 +0000 (UTC)
Received: from relay.hostedemail.com (smtprelay0011.hostedemail.com
 [216.40.44.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF73210E847;
 Wed, 21 Jan 2026 14:53:41 +0000 (UTC)
Received: from omf06.hostedemail.com (a10.router.float.18 [10.200.18.1])
 by unirelay02.hostedemail.com (Postfix) with ESMTP id AF48513B056;
 Wed, 21 Jan 2026 14:53:38 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by
 omf06.hostedemail.com (Postfix) with ESMTPA id 753B320012; 
 Wed, 21 Jan 2026 14:53:33 +0000 (UTC)
Date: Wed, 21 Jan 2026 09:53:56 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Yury Norov <ynorov@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Christophe Leroy <chleroy@kernel.org>, Randy Dunlap
 <rdunlap@infradead.org>, Ingo Molnar <mingo@kernel.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, David Laight <david.laight@runbox.com>,
 Petr Pavlu <petr.pavlu@suse.com>, Andi Shyti <andi.shyti@kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Daniel Gomez <da.gomez@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Joel Fernandes
 <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-modules@vger.kernel.org, linux-trace-kernel@vger.kernel.org, "Yury
 Norov (NVIDIA)" <yury.norov@gmail.com>
Subject: Re: [PATCH v5 0/6] Unload linux/kernel.h
Message-ID: <20260121095356.5b90b1ad@gandalf.local.home>
In-Reply-To: <aWpwHbrvQ2MMGgH-@yury>
References: <20260116042510.241009-1-ynorov@nvidia.com>
 <aWoVRlm1GFux-Z-9@smile.fi.intel.com> <aWpwHbrvQ2MMGgH-@yury>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout06
X-Rspamd-Queue-Id: 753B320012
X-Stat-Signature: 7hndaqh4hbjwzuwg6rf9q9e8akwt1g1d
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+CBSYa8KCvUhwdLmHjFWraz0AOAVFSDEI=
X-HE-Tag: 1769007213-216120
X-HE-Meta: U2FsdGVkX1/EE2lFftZ6F21i0EqRoDcSVTjbX2oqW5/7OP38ayT8yTN4YkVkKSQf0zMYGzeBHy8gpS5qYvvt9xlAuOqkBmGcCmTJG7MTudhVj+V2SrKmaaxzuz5NcKCHxlf4JFeEv0BDDHQxUNEisro+vEDfU7EuSiyw+D1AWo+4ZwH877vmvdOCb4/O9u22SXDVzqDAzj2YYfKJsuEdXY/wKY0wMaBevSDCPebyFZbe4tpdledMCmT4+0Sb+1kP/zs7I6IT0gSVEJCU/DrLz1WZbU/FlBWhcLAsHDYNNgVw+/2V3uSuUrS3rt3tr8D4Yw1bNVwqox2qF4QdbVswXbpuSis4mK2ScucIIDTJQELTzYLFMk03sg==
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

On Fri, 16 Jan 2026 12:06:37 -0500
Yury Norov <ynorov@nvidia.com> wrote:

> > Thanks! Which tree should it go through?  
> 
> Andrew or Steven maybe? As a last resort, I can move it myself.

I think it makes the most sense for Andrew to take it.

Thanks,

-- Steve
